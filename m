Return-Path: <linux-input+bounces-10424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC9A48BA5
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 23:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2857116CA51
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 22:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB7B29D0E;
	Thu, 27 Feb 2025 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQhKqSFx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2052777F6;
	Thu, 27 Feb 2025 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740695676; cv=none; b=T0xDrm1AI3tpFN/cgiYrhmh/Ehr6yMY88v4L5gScxBqJauTSqbNMCOGTN/liKGTd+12E9u1z5KL2x8Npp+n1bS8SsoS4pSsv1AM2fYLuVHjh/wqfvNDBV2e9boPK3yq3WnQWBhJBacxRrndtWdT+9gVljQJlhPGM13pyrkrBKhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740695676; c=relaxed/simple;
	bh=FPaspswSl4uwBOHTp91J8a1KvERimw8bN24yIugWVhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qWjOy6wU2XSWaELJ6/t87Xn8P0aECNKeZr+75RZufPkSLGqnoPSS/Aiw0FNAtQoGEDtfNe2wtCdCsP9FeforEnL8nfKoY8VyDfoYRCCYGG/z2LNCS5gB/sKx46NPMuxEu+Mew7jgAnK9CI88Fm9qKIe87s3wPj+DcZCpguaqXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQhKqSFx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f403edb4eso875854f8f.3;
        Thu, 27 Feb 2025 14:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740695672; x=1741300472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/XkA2KJAYNcmLWwTXUNyznolPWUbVcPY7c2GesTrXU=;
        b=cQhKqSFxrXv4NvtM9ghd/YXUHtl89mYieL+aeMP5jclftb+HAHBl0pYm/q+HsbPXZj
         HTa9WN6dC1AabbqIUn6R1nVsigJR+xK5xQ2oz7H3sGpy7Vgx5L5ShNYfE1Hr35t96xD9
         0TSqWz/+YaBG8vz7QZNWz0eFnSpy+ufHhvvNYiaU3SONOAna3taDNjH+Kv/9/9eJ6tbl
         GUjbx094zGHMbDN+3J5YwuPbhLNimGB1RGw9albAOLd32erNim+fQqgsBj6d0blcbHjL
         HJkcgQ2NzofmDVsmayM/hUPDIaixYNmVSvtg4tqPdoEps/xliCRf9uHZ62bCT3XTjQSq
         5HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740695672; x=1741300472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/XkA2KJAYNcmLWwTXUNyznolPWUbVcPY7c2GesTrXU=;
        b=uYyQoTUZRTB+dsGUn+t9awqT/YvmdrEMe1OfNW5LjvWgQB+jB7hSnkvWWq/136tRui
         TVI1uaVUAO8PU4cQC4PK5G/ED9LqyL2N4k5+pdWM+GklofosWNDpDTsFw9zR1UJ+j5rh
         hsg6GC5ijTDSdvaW4hgJ1kWEbwrvJkpA7o8Ok19YbwPVVGYfKM31uCckCNtqFPVob6Mv
         F3Ms7NXd0S5+SYp6ERPAZOOK/PwctEitggbdEbprHAs5baL+8K2LW8qLPA92PiCt3f4n
         zxyn+QKrHrWxpGOe64YI0mjCoy2qN69YtijITXv/veTohB+X1U1WdaV+LEdD/4FnejAS
         G+ag==
X-Forwarded-Encrypted: i=1; AJvYcCVBpJtFaTIPrdLz9DSKahUIBSdrSHHaealOAjBc7T+6kpzBzpfLEjWyEkktIaDfUCYj6ycBG8csL4oLhVFX@vger.kernel.org, AJvYcCVJuu14lfIuJ8/MvJKY7UmvtLkMmVL7PsV52bvaiUa+D8FvIJxh1AMZ2IFjqO/12h4XTwfGBNitOaM0kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwt0zmXehQLoin8GRM7ANtP/SdjeFFyS8lZnL405sKT0Puf54S
	oQoC3Tnd6Ald3edm69smCiGBIUsEiVLI/qyiBosWL5H+nujv+IDh
X-Gm-Gg: ASbGncshywY27OyKp+rDoN5GTHiscmsXtzB41EXOMQffq5BiN6fHamJN6CUMCKCysZ5
	VqBqilKSGyDCtzrzZJe0Fbaw188pB9sT5NY3lIsLk7gGjegzPbsOSTVvwKBZ6QRdcRJ6lMrNcaZ
	tQYw5FiniE0rQkxiX0aEwmXJgJuXvp3gUQqxjBysCD3OYjbQBfCJNqgDvtpPh56XomUQWP7H2Qk
	+AK8c7ElxbCUKaTPLfR8nGEdrjfmlfq6bh/Rdq/2aYo0DJV8r7jRzKDfdgDec2YeSYgztOQpRNg
	qgT9rIquU5vKQ37cKzrfgwDDLhY=
X-Google-Smtp-Source: AGHT+IHmp7aj0LBvS0mAv2h7rO04GLgzP1+JdVv3lD8iVvcnXGZVgu3Vj8sP18PAE3gbuVvAtt8uZA==
X-Received: by 2002:a05:6000:184c:b0:390:e100:9d39 with SMTP id ffacd0b85a97d-390eca35d3amr764268f8f.37.1740695672553;
        Thu, 27 Feb 2025 14:34:32 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47a6a78sm3206567f8f.23.2025.02.27.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 14:34:32 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: debug: Fix spelling mistake "Messanger" -> "Messenger"
Date: Thu, 27 Feb 2025 22:33:57 +0000
Message-ID: <20250227223357.659460-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 541d682af15a..8433306148d5 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3450,7 +3450,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_MACRO_RECORD_START] = "MacroRecordStart",
 	[KEY_MACRO_RECORD_STOP] = "MacroRecordStop",
 	[KEY_MARK_WAYPOINT] = "MarkWayPoint",	[KEY_MEDIA_REPEAT] = "MediaRepeat",
-	[KEY_MEDIA_TOP_MENU] = "MediaTopMenu",	[KEY_MESSENGER] = "Messanger",
+	[KEY_MEDIA_TOP_MENU] = "MediaTopMenu",	[KEY_MESSENGER] = "Messenger",
 	[KEY_NAV_CHART] = "NavChar",		[KEY_NAV_INFO] = "NavInfo",
 	[KEY_NEWS] = "News",			[KEY_NEXT_ELEMENT] = "NextElement",
 	[KEY_NEXT_FAVORITE] = "NextFavorite",	[KEY_NOTIFICATION_CENTER] = "NotificationCenter",
-- 
2.47.2


