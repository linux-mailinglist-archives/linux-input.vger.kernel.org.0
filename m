Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E20517D056
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 22:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgCGVnr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 16:43:47 -0500
Received: from saul.pp3345.net ([163.172.111.124]:48280 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgCGVnr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 16:43:47 -0500
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Sat, 07 Mar 2020 16:43:47 EST
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: dev@pp3345.net)
        by saul.pp3345.net (Postcow) with ESMTPSA id 0C4859A4476;
        Sat,  7 Mar 2020 22:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1583617041; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references:openpgp:autocrypt;
        bh=eMd+3S034ujloizLSEGn5fFGkqYDsgwRJjOC/E8Yefc=;
        b=Z3v853wDFqTxKkaJhWj6sIsnuw2pU72+gSmTI6p63iaE9T8N7lY/Gz5nOGP1dAiUtWfVVf
        WDdbvKYu34epYZMCLSRzWGH4/nhKtKMOB36NErHmmDXIO6NJM4KveqKfQ27Rdv9wDDBOrz
        0yOFnz8jORrDegafBgykz07b4TbPRkUaJ3Sr7lWJwrfIKermBuEdZTdw9j2A9KjcdBMP4P
        aX9/4c4XfuthgSeYKSV1SF/FD+NrZ5LXkLKUx3zD19E4vNNMXD1TQdLAMcGdEJHowNHDQy
        K8IzpLSTlRQs/AxqZ0beIbvj8TxwZXVZ2CWbzzh8SA+89oQP4tUzu3qVWF7VWw==
From:   Yussuf Khalil <dev@pp3345.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yussuf Khalil <dev@pp3345.net>
Subject: [PATCH] Input: synaptics - Enable RMI on HP Envy 13-ad105ng
Date:   Sat,  7 Mar 2020 22:35:08 +0100
Message-Id: <20200307213508.267187-1-dev@pp3345.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net;
        s=saul; t=1583617041; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references:openpgp:autocrypt;
        bh=eMd+3S034ujloizLSEGn5fFGkqYDsgwRJjOC/E8Yefc=;
        b=PkUK/vNTCjXp2KnTUZDaHfTjfrI+p1ZBESrQx2Yi72BOn2dblXZ+3xQLk1p8EUCZp5ihhD
        kp9kR9WlCGUS/ippOi27MxZG4sptegqEbL6WF/zzHKDE/MQGn5i6isPCC7Z7iJWqfVHP+m
        k7IYzE5RlDOeCWGKcmqcTJsIzRkAkIhScC+FrL1pztUwLZnd2Y3BhZz5DGd/RM4dhMh5QG
        qOTG899mzd+DjdjCucqXa3XWT7HBrSRrKE3tsayEmY8yxL6y+U/VOIlhBm96pgsOWwzPkr
        mpOuNOfUeYzRBdey51Jm84w4diMOMDZE68Ej/8wfGDKWVSagnNYpn4mBapV9Fg==
ARC-Seal: i=1; s=saul; d=pp3345.net; t=1583617041; a=rsa-sha256; cv=none;
        b=Ju1+Se+VmqZWSES//MjMLDPNtfSyZgm0cSu1ageTz9DcGfx+QbJpcvnOsnvKtKTsoSgTfP
        ZBkoxA0g0gP/ZhLIUm7N5+MGODCPSt8fKlwjK2FozJos1gI/PeFUr8O1kLgNo/kFepCH8R
        KokSP6didlnX86dSXQkwl1XqUImm8TfOiYsEsmT3bh9m5tlW0Zah94cmsefWHeUb64AwDV
        AJKLCjqYF5/CUWY3sF2tmdupwdtPt6EIr9TmvFuEevq+xK7xD0KbV53uP/UPQLcDtyJ4yK
        7rphQJXud9e14EXu6q3mzPa53xo2ct80UxD4dUuOJtMEGVTppnj69mxZ1MsFeQ==
ARC-Authentication-Results: i=1;
        saul.pp3345.net;
        auth=pass smtp.auth=dev@pp3345.net smtp.mailfrom=dev@pp3345.net
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This laptop (and perhaps other variants of the same model) reports an
SMBus-capable Synaptics touchpad. Everything (including suspend and
resume) works fine when RMI is enabled via the kernel command line, so
let's add it to the whitelist.

Signed-off-by: Yussuf Khalil <dev@pp3345.net>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 2c666fb34625..4d2036209b45 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -186,6 +186,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
+	"SYN3257", /* HP Envy 13-ad105ng */
 	NULL
 };
 
-- 
2.24.1

