Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402DCCDC8D
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 09:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfJGHp1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 7 Oct 2019 03:45:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39123 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfJGHp1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 03:45:27 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iHNht-0007ds-BR
        for linux-input@vger.kernel.org; Mon, 07 Oct 2019 07:45:25 +0000
Received: by mail-pg1-f198.google.com with SMTP id r25so1863074pga.20
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 00:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=vEuH2bRCO9qIKoewfyYnOM95mPIls7xJzpSnS5DmW6c=;
        b=Fvf4WOtexP+A8dz2YXjmGHxcd75L7okFV4Toi/Y92OxZPwJV+a97UGuo/g74fEBAKr
         nYQPRxpG6ur9b/W5yPy0OvPXi9ygIJ7NNGSdVBrENLjitdJR0XtYsM6GPV1r523slk4V
         w2TXkvkv9OKuOVewOaBX+xBuchw+9ucU4HFdG7x8nkNatWrX5rIxl4Z5rCQy6TgNhzHJ
         Y+zaRUMcf8eaEWtVA49EzcWuXhDznz0pGtGcmJdst5TSUtlfTupfyQj9USPmlIsnOlsl
         bQAd6tbuZUS2YPNIyPVckkAuDQcq8vFERU+erSDnCHC6VoxJ6zJ8fMoBzSyFxg6mkbhq
         697A==
X-Gm-Message-State: APjAAAVm9nhGysALKsLlPCS8Kl6YBiHCysFAVVVHaUegc2x4mcuB6iv4
        ZAsXNyPsPY82aMFVqVJN8KSWSU7D4fUteJfybbRZVwB674Gd0tpUz8jofs40I6GI7bX0YPVhryc
        vsxv0ZvMzH8dsCpwZuaNfFgrDyj75frvH5qAHbJGP
X-Received: by 2002:a63:ab05:: with SMTP id p5mr29112885pgf.414.1570434323820;
        Mon, 07 Oct 2019 00:45:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxC1Dz/vvDr2wiPxR+oy5eK2dmwy1bOOzxIvxm4qShOd4q7P6EEQqG9PmoiWAOhiQamku3L0w==
X-Received: by 2002:a63:ab05:: with SMTP id p5mr29112859pgf.414.1570434323409;
        Mon, 07 Oct 2019 00:45:23 -0700 (PDT)
Received: from 2001-b011-380f-3c42-ecd4-c98e-b194-f9c1.dynamic-ip6.hinet.net (2001-b011-380f-3c42-ecd4-c98e-b194-f9c1.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:ecd4:c98e:b194:f9c1])
        by smtp.gmail.com with ESMTPSA id r11sm12874941pgn.67.2019.10.07.00.45.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 00:45:22 -0700 (PDT)
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: How to make sure touchpad doesn't use psmouse.ko?
Message-Id: <7DD64ADB-478C-408C-873D-C07186FEB65F@canonical.com>
Date:   Mon, 7 Oct 2019 15:45:19 +0800
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        ray.chen@canonical.com, You-Sheng Yang <vicamo.yang@canonical.com>
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

When we are enabling a new hardware, sometimes touchpad may still use psmouse.ko due to bugs or missing IDs.
Is there a way to quickly to determine the touchpad doesn't use psmouse but something like SMBus or HID over I2C?

Kai-Heng
