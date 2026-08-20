#include <chrono>
#include <cstdint>
#include <functional>
#include <thread>

#define DART_EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

using ResultCallback = void (*)(int64_t threadId, int32_t seconds);

DART_EXPORT void RegisterCallback(ResultCallback callback, int32_t seconds) {
  std::thread worker([callback, seconds]() {
    const std::hash<std::thread::id> hasher;
    const int64_t threadId = static_cast<int64_t>(hasher(std::this_thread::get_id()));
    std::this_thread::sleep_for(std::chrono::seconds(seconds));
    callback(threadId, seconds);
  });

  worker.detach();
}
