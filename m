Return-Path: <linux-input+bounces-13321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6CAF095F
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 05:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7815D4E3422
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 03:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD431C6B4;
	Wed,  2 Jul 2025 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Rz8YIEal"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C464C6E;
	Wed,  2 Jul 2025 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427995; cv=none; b=BKoTU7D2rJbpd8/5WyXQlNebkdqLql8geetxj3CJZtFQAicT50ubZNz8fwTebuzfwoKLi7C/Nq6ri68sjCUWJmIIxAbWoA45lVy41LZUU18Z7QF9OFMLKBZaEOeS/of7pmQyh+F9v6dUiG6cpJswi3BMs2DBgfegeiInp3OZfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427995; c=relaxed/simple;
	bh=OqLm4KHBYS1vArDDDN7xGwiwe0bpV5CXCJQW/1+ec7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJlGML86CtlFTF1l57ESj5Wr9FuQcA3YXIli6wRtY8x2uDimx3061df4ad2X8AAh9qXVyFBiDfe6z0YY6jrfS4HJr7AOrD0xhhjNjdCvWudtj6aFE2QGFRuUj/0dV8cmKErccNA3j6PExcAQ9s4/J9FgiCDLBCNTC8B4id0xUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=Rz8YIEal; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751427986; bh=OqLm4KHBYS1vArDDDN7xGwiwe0bpV5CXCJQW/1+ec7w=;
	h=From:To:Cc:Subject:Date:From;
	b=Rz8YIEalhdnmMEecTVnWBdAEEPubcL56l99pfAewZ1jdTN56hexxVFsJHCcVPBSOD
	 OT9XBVfGQXZxOmB+pu9fBjIomJzvbwJI8QJd2uYcLmlbD3l63JzjDnW0DboOMiKl0d
	 BbXR2HxTvcEBSUvkK76riCJ7KF4zp5YMMUq7Th+S+UbiaXheM1ok14SKyEu700o15i
	 ct+zOSS0GFPXvDxF9qzCbJESXnJw54gZbO3e+V/lagr7WOv5jSCkqTejiyNtcwnTss
	 6LHJGRFhK/QieY/+mEpyvlBqbaIIywuMPggwYSKhYow9/KEzA5KLUzqk03OwSPAo3f
	 lVdWychjIEBIw==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id A6AF2A01E;
	Tue,  1 Jul 2025 20:46:26 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] Documentation: Fix capitalization of XBox -> Xbox
Date: Tue,  1 Jul 2025 20:45:00 -0700
Message-ID: <20250702034500.124741-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This also improves the phrasing of "an example" listing two examples.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 Documentation/input/gamepad.rst                    | 6 +++---
 Documentation/userspace-api/media/rc/rc-protos.rst | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
index eca17a7f5258..2bba721aa20b 100644
--- a/Documentation/input/gamepad.rst
+++ b/Documentation/input/gamepad.rst
@@ -192,6 +192,6 @@ Gamepads report the following events:
 
 - Profile:
 
-  Some pads provide a multi-value profile selection switch.  An example is the
-  XBox Adaptive and the XBox Elite 2 controllers.  When the active profile is
-  switched, its newly selected value is emitted as an ABS_PROFILE event.
+  Some pads provide a multi-value profile selection switch. Examples include
+  the Xbox Adaptive and the Xbox Elite 2 controllers. When the active profile
+  is switched, its newly selected value is emitted as an ABS_PROFILE event.
diff --git a/Documentation/userspace-api/media/rc/rc-protos.rst b/Documentation/userspace-api/media/rc/rc-protos.rst
index 2a888ff5829f..ec706290c921 100644
--- a/Documentation/userspace-api/media/rc/rc-protos.rst
+++ b/Documentation/userspace-api/media/rc/rc-protos.rst
@@ -449,6 +449,6 @@ the 32 bits.
 xbox-dvd (RC_PROTO_XBOX_DVD)
 ----------------------------
 
-This protocol is used by XBox DVD Remote, which was made for the original
-XBox. There is no in-kernel decoder or encoder for this protocol. The usb
+This protocol is used by Xbox DVD Remote, which was made for the original
+Xbox. There is no in-kernel decoder or encoder for this protocol. The usb
 device decodes the protocol. There is a BPF decoder available in v4l-utils.
-- 
2.49.0


