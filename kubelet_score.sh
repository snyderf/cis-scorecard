set -o errexit
set -o nounset

RESULTS_DIR="${RESULTS_DIR:-/tmp/results}"

ps -ef |grep kubelet >"${RESULTS_DIR}/kubelet_config"
echo -n "${RESULTS_DIR}/kubelet_logs" >"${RESULTS_DIR}/done"


