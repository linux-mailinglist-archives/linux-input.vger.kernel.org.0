Return-Path: <linux-input+bounces-11926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6CA97066
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 17:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1A0188C3E5
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E782749CD;
	Tue, 22 Apr 2025 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="EYZ3kgqU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch [109.224.244.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA519CC3A
	for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335321; cv=none; b=Kq88XlBCcHEKAwOxG43Do8aWVAIWaJgnXA+03QF+m4eMTNqYUnZWQ+wI6PFhwJEHpf8E4AL9wXBiNPk9X2IZYk2kx+W5IgHJQxASgNeEYoc8B4m6gOF88WWCzyLlyosTlRrxCy5A/9WuU+tjC72KQ5mr0A4zO/2dJRaF+qChE/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335321; c=relaxed/simple;
	bh=XrDdZMiQCYZWtkyVR+1sBXNNGQPlKxsaHf0T2Hnlrwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYw9/lJSJZLbzpyVO5r0QIpQeEyhj+1PcROGMJWQz/SVyE2LMxuf7J9TprcN3RllI/e1uzkZ/O9ZLW2QLN1tjoL/dYPluG1sgtop2iPnRyETEPm0Qa7AcjGhXR2Rf4DFUysKsh5UvOzJhCuGqQHCSjs3guzzCDtrSgTVqc66s6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=EYZ3kgqU; arc=none smtp.client-ip=109.224.244.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745334916; x=1745594116;
	bh=qinWNI4zrP64TYceXuUBsDjhYtu4GSfZQrgajmm4aQw=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=EYZ3kgqUpN8wRIfAfRGNEicZc/qp/G9fVH11TKXb9eaUL0YAvTdSRMG949zvZL0Ka
	 6ihSJi11JveIIUzPHL9Al3v+zwFBwkcrKgf/EC6lxm6pzyl2i8oqAD6/6pUsQmwv83
	 N/I36hFak0XM9AMpVI4DpKI3OjslQEmTTLj2cFTmqXgHqriiJBTaF5qDSvGRmYg2tf
	 9W0V4JskVgHFMi2oxyDEZ59gRinqnG7dHCZwg2KbWy+pylale8d1lZmUnsQ/gb5dpy
	 peUgnAYgY0elncEAyoguqlstkf8YKTwMGBy9mIB3UXz6Flw0FvcHJozp8drD53zPK/
	 HkCnqnDNiwqzg==
X-Pm-Submission-Id: 4Zhm4z0y89z4wx9h
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 22 Apr 2025 17:15:03 +0200
Subject: [PATCH 2/2] Input: goodix - Allow DT specification of missing
 reset pull-up
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-goodix-no-reset-pull-up-v1-2-3983bb65a1bf@geanix.com>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
In-Reply-To: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745334911; l=1750;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=XrDdZMiQCYZWtkyVR+1sBXNNGQPlKxsaHf0T2Hnlrwg=;
 b=jRW+MrsUzdfwfOoQGvfpiB9UjYWL0lEg42ggfjTprYEFFJoNGZKSePA0VQOholEEcth9FEuNx
 XgRFhA0zOE/ALCVNY//VNmN+XoPjN1LEqZuJ/OnYIzHQUTeXExz8XVQ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

In commit a2fd46cd3dbb ("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
a fix for problems on various x86/ACPI devices where external
pull-up is missing were added. The same type of problem can exist on
device-tree platforms, and the fix can be activated by adding the
no-reset-pull-up device-tree property.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/input/touchscreen/goodix.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3e8a51c91449533b4d5185746df6b98676053dd..3a55b0f8e5132a5e1fe77bd27de74e058a4afdaf 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -775,7 +775,8 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
 	 * power. Only do this in the non ACPI case since some ACPI boards
 	 * don't have a pull-up, so there the reset pin must stay active-high.
 	 */
-	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
+	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO &&
+	    ts->gpiod_rst_flags == GPIOD_IN) {
 		error = gpiod_direction_input(ts->gpiod_rst);
 		if (error)
 			goto error;
@@ -969,6 +970,13 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	 */
 	ts->gpiod_rst_flags = GPIOD_IN;
 
+	/*
+	 * Devices that does not have pull-up on reset signal should not be
+	 * changed to input
+	 */
+	if (device_property_read_bool(dev, "no-reset-pull-up"))
+		ts->gpiod_rst_flags = GPIOD_ASIS;
+
 	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
 	if (IS_ERR(ts->avdd28))
 		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");

-- 
2.49.0


