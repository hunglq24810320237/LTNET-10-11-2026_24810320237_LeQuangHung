namespace ProjectTasks.DTO;
public sealed record ProjectItem(int Id,string Name);
public sealed record TaskAssignment(int TaskId,int MemberId);