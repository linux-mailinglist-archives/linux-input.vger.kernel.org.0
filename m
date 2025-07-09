Return-Path: <linux-input+bounces-13434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F107AFEC9B
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 16:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23A1189BC08
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBACB2E5B20;
	Wed,  9 Jul 2025 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9glH6zu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE42E5B13;
	Wed,  9 Jul 2025 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072733; cv=none; b=ZT+/a8P/iWYrQWdfec/1D1A2nlzh98v6PHTNvnd6BBpSfEr+CkD/4UyB0QqfEZj0g3ZnRhbFotD6FumbN53sVxG7XfoygFV75D7vLgjA0b4TqfoE/JhhY9zE6ZCyaL+DDbONW7Y2NNR+NTRSaSnJw3PRtKQ1fXYNKrc/M3yS16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072733; c=relaxed/simple;
	bh=azZoStJ5QM8poD0VSBjYlRNrZW41BkMbjKVGsPL0jag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZcPYnSm8QIcwYVQ2aENdipzBvYT+GxEuC86XtTWuOncNxIVpZJ6aw8EJqgDy79u06ke0wLBvQHSCeCn+LLqSX9L8yzUTGr7GhZhrCbDdK4k8htBkdZsv065Zb6tVjvVRZM1YfxUuc6TAmixlv1WAe3p/dtu/IG12rOl4jxKjueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9glH6zu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09F9C4CEEF;
	Wed,  9 Jul 2025 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752072733;
	bh=azZoStJ5QM8poD0VSBjYlRNrZW41BkMbjKVGsPL0jag=;
	h=From:Subject:Date:To:Cc:From;
	b=d9glH6zuxgGQPC8aksPUR8RPCfl/bjWGbZTMY/pz8YaSR8TwNnKox3+2eEb7O55np
	 62qE4kOEFIFmhqNSk2FrklpmYxO0RbWYcMDUQBfP53hjgAhWpbCCl6HSrwmDza99pJ
	 b5mcOYXcQxZ/3MBQw0ZcaxQVPLpTyIgB+aeS4kYcWlBoaXbfANjUuAe0e+UapjqVIe
	 8D2e1GuTAevkFps+4F1u2cxEfMGctDjpeDXI7aDasdEkNzdXSZsktMa9hWNuUK9Ws+
	 bZUl1pnCBtjgmlhqbr5Mm5eUh11kLWW04w7mk3LAHoUQ+voqL5u2tdSCjZD9JT2T0J
	 OqFPIxUyuwzIA==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH 0/3] HID: core: fix __hid_request when no report ID is used
Date: Wed, 09 Jul 2025 16:51:45 +0200
Message-Id: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGCbmgC/x2M0QpAQBAAf0X7bOuOOOdX5OFisaWjPSSXf3d5n
 JqZCIGEKUCbRRC6OPDmE+g8g2FxfibkMTEUqqiUURaF9k0ODPwQ+nNdsTS1tuSS0DSQsl1o4vt
 fdv37fgSbzkZiAAAA
X-Change-ID: 20250709-report-size-null-37619ea20288
To: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org, 
 syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072731; l=1457;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=azZoStJ5QM8poD0VSBjYlRNrZW41BkMbjKVGsPL0jag=;
 b=S+sszfxuqTW7t7g5r0nOqnfD0+lS7peXCkoVQYI05B2nkXTqCcgbPkQ7U0hj9nPbm4Kof6j8j
 xwjwMEPD+WpCtvMSYFI9oZXYuJoqM3SoSnA6uar8+J6+ArmQ5y4OchZ
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

[Ideally I'd like to have tests in selftests, but I couldn't extract
them out of the syzbot reproducer, so sending that first series to check
against syzbot]

Followup of https://lore.kernel.org/linux-input/c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu/

This initial series attempt at fixing the various bugs discovered by
Alan regarding __hid_request().

Syzbot managed to create a report descriptor which presents a feature
request of size 0 (still trying to extract it) and this exposed the fact
that __hid_request() was incorrectly handling the case when the report
ID is not used.

Send a first batch of fixes now so we get the feedback from syzbot ASAP.

Note: in the series, I also mentioned that the report of size 0 should
be stripped out of the HID device, but without a local reproducer this
is going to be difficult to implement.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Benjamin Tissoires (3):
      HID: core: ensure the allocated report buffer can contain the reserved report ID
      HID: core: ensure __hid_request reserves the report ID as the first byte
      HID: core: do not bypass hid_hw_raw_request

 drivers/hid/hid-core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)
---
base-commit: 1f988d0788f50d8464f957e793fab356e2937369
change-id: 20250709-report-size-null-37619ea20288

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


