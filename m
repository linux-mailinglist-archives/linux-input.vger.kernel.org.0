Return-Path: <linux-input+bounces-9843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49889A2C428
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E8E167FC1
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E811F4E21;
	Fri,  7 Feb 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRo3Bd+0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F21F4169;
	Fri,  7 Feb 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936585; cv=none; b=iXmjTRyHsVKKKebPPyJHZvWVfEJ9uaJuxKs91qVjlsRg5wBw1R7qblKGZevfSFWfni0PpVtNmoKzp4cNnmec7x4zOhi4O3mdFMPjOcXJGD890S8OauEZKe2cVRboLJcjQgMnQIkfTpb9S7ZHHGRfu8l2EhpI5zsFpwrj/fGmcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936585; c=relaxed/simple;
	bh=YU/VtYPPXRiwjAw7pRWNE3J6oCMCirhQD+Bn+naAFDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OHDlo64cT/TJHo3OzQoMJcdJc39JxQzzvFjdLCikwCvRsytBNjEbpXtFimv+MQ3Dfwh78ND5teTmBSYS0zeSJhUQM6HDANQALNNk075Qw+ii0W3UPNux+VpxIHJMkPFyA5WPTAq8VNzF1GaphSM2xT6MfTb5jcaSe/kUg0Ws5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRo3Bd+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885EDC4CED1;
	Fri,  7 Feb 2025 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936584;
	bh=YU/VtYPPXRiwjAw7pRWNE3J6oCMCirhQD+Bn+naAFDA=;
	h=From:Subject:Date:To:Cc:From;
	b=VRo3Bd+010tFY/WAYh+JbEuXop0nn5BVbnZFFgHpYiDKD5eZK01v3l8pLwcuxWLMg
	 nAv6MU0J0/FeCwotOJ10J+tZsfo8lGZNVtvPnJTOUiYuuc+2UNWcELFVA2joAaxKSn
	 0jo/FK9PxB7j3cF1mi2qE0+G8xE5IXnLwzs4hsreDcMBxj/exosH5agl2Hc9zNrpIF
	 72gWJvxTRV1y/ifvnYAsnP+KDbUbEJ/DZHuFQezvR3TuQIGKCZ/28713JfqcK5mC4h
	 z1+pVnHxAweC7k4H0boRP2HlZnUCCcXRZmX5JrIvqwGZyUynLKv3FqRJ2BiNCT5FPi
	 ZEXrj0S0tTKwg==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH 0/7] HID: bpf: sync with udev-hid-bpf
Date: Fri, 07 Feb 2025 14:55:56 +0100
Message-Id: <20250207-bpf-import-2025-02-07-v1-0-6048fdd5a206@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwQpmcC/x2MQQqAMAzAviI9W6gFcfMr4sFppz2oYxMRxL87P
 SaQ3JAkqiRoixuinJp03zJUZQHjMmyzoE6ZgYlrYmrQBY+6hj0e+Dkkxmy9ccSOGmssQW5DFK/
 X/+3653kB6lipB2cAAAA=
X-Change-ID: 20250207-bpf-import-2025-02-07-f8b02b079890
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>, Aki Van Ness <aki@lethalbit.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738936583; l=1391;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=YU/VtYPPXRiwjAw7pRWNE3J6oCMCirhQD+Bn+naAFDA=;
 b=SGh9o3ndf76w5h5W+60IzJpcRb/FQo4lY4FmIosmT2rOzfo8NiNJmO5EUYQiODxowyzmmB3uo
 /wES8wyHbyWCPc+HHT6k8eFmBnLF4LSMpB3lCaWN4AodN6l95va4+0N
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Here are a few hid-bpf device fixes from udev-hid-bpf.
We've got the usual XP-Pen and Huion plus one from TUXEDO.

Cheers,
Benjamin

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Benjamin Tissoires (7):
      HID: bpf: Add support for the default firmware mode of the Huion K20
      HID: bpf: Suppress bogus F13 trigger on Sirius keyboard full fan shortcut
      HID: bpf: Added updated Kamvas Pro 19 descriptor
      HID: bpf: add support for the XP-Pen Artist Pro 19 (gen2)
      HID: bpf: import new kfunc from v6.10 & v6.11
      HID: bpf: new hid_bpf_async.h common header
      HID: bpf: add a v6.11+ compatible BPF fixup for the XPPen ACK05 remote

 drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c   |  75 ++-
 drivers/hid/bpf/progs/Huion__KeydialK20.bpf.c      | 531 +++++++++++++++++++++
 .../progs/TUXEDO__Sirius-16-Gen1-and-Gen2.bpf.c    |  47 ++
 drivers/hid/bpf/progs/XPPen__ACK05.bpf.c           | 330 +++++++++++++
 drivers/hid/bpf/progs/XPPen__ArtistPro16Gen2.bpf.c |  44 +-
 drivers/hid/bpf/progs/hid_bpf_async.h              | 219 +++++++++
 drivers/hid/bpf/progs/hid_bpf_helpers.h            |  19 +
 7 files changed, 1257 insertions(+), 8 deletions(-)
---
base-commit: 27c02784773a69fd896e42f3cec73be8c5c83c1f
change-id: 20250207-bpf-import-2025-02-07-f8b02b079890

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


