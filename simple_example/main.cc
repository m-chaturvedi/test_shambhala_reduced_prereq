#include <cmath>
#include <drake/common/drake_assert.h>
#include <drake/systems/analysis/simulator.h>
#include <drake/systems/framework/vector_system.h>

namespace shambhala {
namespace systems {

/**
 * Simple Continuous Time System
 *
 * xdot = -x + x^3
 * y = x
 */
class SimpleContinuousTimeSystem : public drake::systems::VectorSystem<double> {
 public:
  SimpleContinuousTimeSystem()
      : drake::systems::VectorSystem<double>(0,    // Zero inputs.
                                             1) {  // One output.
    this->DeclareContinuousState(1);               // One state variable.
  }

 private:
  // xdot = -x + x^3
  virtual void DoCalcVectorTimeDerivatives(
      const drake::systems::Context<double>& context,
      const Eigen::VectorBlock<const Eigen::VectorXd>& input,
      const Eigen::VectorBlock<const Eigen::VectorXd>& state,
      Eigen::VectorBlock<Eigen::VectorXd>* derivatives) const {
    drake::unused(context, input);
    (*derivatives)(0) = -state(0) + std::pow(state(0), 3.0);
  }

  // y = x
  virtual void DoCalcVectorOutput(
      const drake::systems::Context<double>& context,
      const Eigen::VectorBlock<const Eigen::VectorXd>& input,
      const Eigen::VectorBlock<const Eigen::VectorXd>& state,
      Eigen::VectorBlock<Eigen::VectorXd>* output) const {
    drake::unused(context, input);
    *output = state;
  }
};

}  // namespace systems
}  // namespace shambhala

int main() {
  // Create the simple system.
  shambhala::systems::SimpleContinuousTimeSystem system;

  // Create the simulator.
  drake::systems::Simulator<double> simulator(system);

  // Set the initial conditions x(0).
  drake::systems::ContinuousState<double>& state =
      simulator.get_mutable_context().get_mutable_continuous_state();
  state[0] = 0.9;

  // Simulate for 10 seconds.
  simulator.StepTo(10);

  // Make sure the simulation converges to the stable fixed point at x=0.
  DRAKE_DEMAND(state[0] < 1.0e-4);

  // TODO(russt): Make a plot of the resulting trajectory.
  std::cout  << "SIMPLE EXAMPLE RUN" << std::endl;

  return 0;
}
