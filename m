Return-Path: <linux-input+bounces-574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6A807E0D
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 02:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FA52B211C1
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 01:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B8115C6;
	Thu,  7 Dec 2023 01:40:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DA5D63;
	Wed,  6 Dec 2023 17:40:23 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-286e9ce9feaso119781a91.1;
        Wed, 06 Dec 2023 17:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701913223; x=1702518023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5gAtdhf3r5uOhJWk/x5Qdd2aBvmdfuVX+ev2hC4WxQ=;
        b=iHljwmTnfLGWqFkeijr0aE2vdrM6DLkPK7u0iFkmry7rjQg2nGshs1aIGmVv1vx8X0
         IcHDeCpsREqbXNshJj8AMAcRsJ2solKDQJw2fZCAEFiK5yCWPJ7S9qoKitkN34YKXmSL
         Ds+Gl/mVIohK1Jo0+N4COf2SMI0SZ5gcZiOawffVr6NrC0Al7/zDPFsow7bdcPDCIhei
         ryns/vD6XNUdXisli8sDAcPl3qVzgjUq479rgiYeQcAJ44M6lyL8I20HkQX5eHZcp1Ag
         gQQeZ1yHiUsYStjHcHtrq0aJ2+SR1G9fvSBQ7UwbuIFGjTn8K8eyVxqvoVs8e2xj6jXx
         J+wg==
X-Gm-Message-State: AOJu0YwGBoVCWDXK/eY+6h6NsNFRJxDTSalzFF67HaffWPiyAy+FmAQD
	gWlco+x6ralBph2U6Zqm26Q=
X-Google-Smtp-Source: AGHT+IHbcHzy97gpr5HE+p3R5XYYVU16Ol709lMcB2sU9udtuHGesq8L/wW43jaXT1xj3P7704OYYw==
X-Received: by 2002:a17:90b:4b4a:b0:286:5123:ddaf with SMTP id mi10-20020a17090b4b4a00b002865123ddafmr3650342pjb.3.1701913223416;
        Wed, 06 Dec 2023 17:40:23 -0800 (PST)
Received: from tgsp-ThinkPad-X280.. ([223.148.152.37])
        by smtp.gmail.com with ESMTPSA id sj16-20020a17090b2d9000b00286e9f15f21sm72304pjb.12.2023.12.06.17.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 17:40:23 -0800 (PST)
From: xiongxin <xiongxin@kylinos.cn>
To: tglx@linutronix.de,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org,
	xiongxin <xiongxin@kylinos.cn>,
	stable@vger.kernel.org,
	Riwen Lu <luriwen@kylinos.cn>
Subject: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called in pairs
Date: Thu,  7 Dec 2023 09:40:03 +0800
Message-Id: <20231207014003.12919-1-xiongxin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an interrupt controller uses a function such as handle_level_irq()
as an interrupt handler and the controller implements the irq_disable()
callback, the following scenario will appear in the i2c-hid driver in
the sleep scenario:

in the sleep flow, while the user is still triggering the i2c-hid
interrupt, we get the following function call:

  handle_level_irq()
    -> mask_ack_irq()
      -> mask_irq()
				i2c_hid_core_suspend()
				  -> disable_irq()
				    -> __irq_disable()
				      -> irq_state_set_disabled()
				      -> irq_state_set_masked()

  irq_thread_fn()
    -> irq_finalize_oneshot()
      -> if (!desc->threads_oneshot && !irqd_irq_disabled() &&
	     irqd_irq_masked())
      	 	unmask_threaded_irq()
		  -> unmask_irq()

That is, when __irq_disable() is called between mask_irq() and
irq_finalize_oneshot(), the code in irq_finalize_oneshot() will cause
the !irqd_irq_disabled() fails to enter the unmask_irq() branch, which
causes mask_irq/unmask_irq to be called unpaired and the i2c-hid
interrupt to be masked.

Since mask_irq/unmask_irq and irq_disabled() belong to two different
hardware registers or policies, the !irqd_irq_disabled() assertion may
not be used to determine whether unmask_irq() needs to be called.

Cc: stable@vger.kernel.org
Signed-off-by: xiongxin <xiongxin@kylinos.cn>
Signed-off-by: Riwen Lu <luriwen@kylinos.cn>

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 1782f90cd8c6..9160fc9170b3 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1120,8 +1120,7 @@ static void irq_finalize_oneshot(struct irq_desc *desc,
 
 	desc->threads_oneshot &= ~action->thread_mask;
 
-	if (!desc->threads_oneshot && !irqd_irq_disabled(&desc->irq_data) &&
-	    irqd_irq_masked(&desc->irq_data))
+	if (!desc->threads_oneshot && irqd_irq_masked(&desc->irq_data))
 		unmask_threaded_irq(desc);
 
 out_unlock:
-- 
2.34.1


