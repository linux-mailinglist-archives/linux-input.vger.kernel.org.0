Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CD449CC98
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 15:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbiAZOom (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 09:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47766 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235606AbiAZOoe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 09:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643208273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=h+Gqz+i3jr65DckDxVwcGyle0pa93d1ByC6vRQ3mUOk=;
        b=FFMF+yhTNWK+szby7lrgtV8gVSRp0owk1H5yoaGe33NeXOFb+tZh1UJworn7aAd5ZsKH0q
        JwmohSAa6NpZsX+Ypww9iwnqXz0yBmTBgXpIDf5exytmbMeg61fu9lLR7bYjEVe7b8MoWV
        tV9mGyhetcDJjdzD+QpebzKW+PyE/14=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-BRP0uQUwPo-V_Ac-ve6xVA-1; Wed, 26 Jan 2022 09:44:32 -0500
X-MC-Unique: BRP0uQUwPo-V_Ac-ve6xVA-1
Received: by mail-oi1-f198.google.com with SMTP id s131-20020acac289000000b002c6a61fd43fso13420361oif.23
        for <linux-input@vger.kernel.org>; Wed, 26 Jan 2022 06:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+Gqz+i3jr65DckDxVwcGyle0pa93d1ByC6vRQ3mUOk=;
        b=tHFHUAXZTt3PHcLj9AdL3dx16+U2OSNIE+vCc3QV+QLHONH8xAEDqGPj/Iqgc8mG0x
         Dfzs+LaiomLUtOoGQ/IPwg4s7lTcYD926We7lvy+Bxv3Pn8p3tvsOFF6maNHj3FH9fs4
         rgJz5AkV4BqnSXX8Qb80ygBOHCNMCL4pYw6U2lZgEzcxyVsd7FRzZgIZ7CuHzeIsL/J4
         7m252VLnylK1NooValOswmX5WT/VSarRc5gxZBphqyhHymr+4MfM2UeqC46dGPB2Cynx
         x1DyEG5+zgy479GWmX+wqrjn/CkJfJiJBbfJD6QvnAgD8hb5+HY2Qtm60BgWiMq4sS01
         FtmA==
X-Gm-Message-State: AOAM532rrHrWKaCRU2dppe400bNaW8+mSDrsKO3fPxo2F2Z6rg0x38Ij
        tZT9ssMkchpZbl2ADOGHPxfHQdp6kfgeLsF9huUCZcxVFFh033bD2phnmRDT/we6T8DQPm2dxXb
        CF96be2n4Je6c8DGJfT0B6lA=
X-Received: by 2002:a4a:d02c:: with SMTP id w12mr352033oor.38.1643208271954;
        Wed, 26 Jan 2022 06:44:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHGKh36XsGYbRTM/FfJGvF4MhP6mweAYuEeF4qWKixv/xgkH90AL3sP2UBkWdd0n152muikQ==
X-Received: by 2002:a4a:d02c:: with SMTP id w12mr352021oor.38.1643208271748;
        Wed, 26 Jan 2022 06:44:31 -0800 (PST)
Received: from ovpn-116-179.gru2.redhat.com ([2804:2984:10c:7100:db78:6ebc:9e65:6c6e])
        by smtp.googlemail.com with ESMTPSA id m130sm8896672oif.21.2022.01.26.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 06:44:31 -0800 (PST)
From:   Lucas Zampieri <lzampier@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     lains@riseup.net, nlopezcasad@logitech.com,
        Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH] HID: logitech-dj: add new lightspeed receiver id
Date:   Wed, 26 Jan 2022 11:44:00 -0300
Message-Id: <20220126144400.130797-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As of logitech lightspeed receiver fw version 04.02.B0009,
HIDPP_PARAM_DEVICE_INFO is being reported as 0x11.

With patch "HID: logitech-dj: add support for the new lightspeed receiver
iteration", the mouse starts to error out with:
  logitech-djreceiver: unusable device of type UNKNOWN (0x011) connected on
  slot 1
and becomes unusable.

This has been noticed on a Logitech G Pro X Superlight fw MPM 25.01.B0018.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/hid/hid-logitech-dj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index a0017b010c34..9f68c0631439 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1068,6 +1068,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
 	case 0x0f:
+	case 0x11:
 		device_type = "eQUAD Lightspeed 1.2";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
 		workitem.reports_supported |= STD_KEYBOARD;
-- 
2.34.1

