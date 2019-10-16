Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC4CD8EBF
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 12:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbfJPK6Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 16 Oct 2019 06:58:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39751 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfJPK6Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 06:58:25 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iKh0Y-0002aE-Td
        for linux-input@vger.kernel.org; Wed, 16 Oct 2019 10:58:23 +0000
Received: by mail-pf1-f200.google.com with SMTP id x10so18352428pfr.20
        for <linux-input@vger.kernel.org>; Wed, 16 Oct 2019 03:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=X9e+rYfCKq9rMOwR5cFzJTrPdtsUNS9gZTSPtA+TTns=;
        b=Tslqi2dnIm6NkWCX12CS01gwGiUgYQ3lqvFTeBp/mE20D8tM4XAnhI6X0WnbyyvIS/
         0rRYYRBbhOFBUUkb//R5CWradSwMKHxKnihvqxRKy/J+Ea2z+t/gwfYwhIxjzXB7uWyu
         YJ9MpsTy0SdxBSCkeQK+k3Hp3Nb4jGEBAOb3MpUY8ADiovrrPQVCwVXqFlCGMbZiuAD2
         W6oCnL7BDaUsnxLmhi0/cKbX/3xp4jz/HStT2SPukcnsRNvmypkhb1+gBv9hnZBWjVc1
         qgBqHmwvKb5VsLO6c9/CRMah+jUivnWrDpRlrxSCNmMcDj0Uiu+bn64g85u3pNvmMx0d
         XJvQ==
X-Gm-Message-State: APjAAAVBtK/4YQcWNW2gYVml8msQYpgduKrAJL9Gobi547KqAOSlX72k
        oh7ONK1XHRsj+EBBN1tiHgZjslrbm/a5C4EK6u9NMy508zyq+br5AUhl7TY0dthJpNPn8uTnQX8
        manMjrvhiHtwLhHhZuj9yM/PWcsLe/YiPpZbi3fXp
X-Received: by 2002:a17:90a:77c3:: with SMTP id e3mr4153524pjs.138.1571223501512;
        Wed, 16 Oct 2019 03:58:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1+VQmn2ikwDy8ZcHNHDbkoBiVW67IacIrzpIPqPJ6C1axwgV5IgfH/8sMnIBkyQa1+FqOeQ==
X-Received: by 2002:a17:90a:77c3:: with SMTP id e3mr4153490pjs.138.1571223501064;
        Wed, 16 Oct 2019 03:58:21 -0700 (PDT)
Received: from 2001-b011-380f-3c42-4027-e4ae-869e-766c.dynamic-ip6.hinet.net (2001-b011-380f-3c42-4027-e4ae-869e-766c.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:4027:e4ae:869e:766c])
        by smtp.gmail.com with ESMTPSA id r24sm25581001pfh.69.2019.10.16.03.58.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 03:58:20 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
Subject: Re: How to make sure touchpad doesn't use psmouse.ko?
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CAO-hwJKrZVUPL_=KrFNhzx8S1TP2M6zUEM_Ak8m7ze-1b9cTMA@mail.gmail.com>
Date:   Wed, 16 Oct 2019 18:58:18 +0800
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        ray.chen@canonical.com, You-Sheng Yang <vicamo.yang@canonical.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <043A897E-9EF7-43C2-B214-CD57B85DB5E6@canonical.com>
References: <7DD64ADB-478C-408C-873D-C07186FEB65F@canonical.com>
 <CAO-hwJKrZVUPL_=KrFNhzx8S1TP2M6zUEM_Ak8m7ze-1b9cTMA@mail.gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
X-Mailer: Apple Mail (2.3601)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

> On Oct 11, 2019, at 17:35, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> 
> Hi Kai-Heng,
> 
> On Mon, Oct 7, 2019 at 9:45 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> 
>> Hi,
>> 
>> When we are enabling a new hardware, sometimes touchpad may still use psmouse.ko due to bugs or missing IDs.
>> Is there a way to quickly to determine the touchpad doesn't use psmouse but something like SMBus or HID over I2C?
> 
> Quick answer: no :)
> 
> For HID over I2C devices, they have to be included in the DSDT, so we
> can detect those at the ACPI level, and they should automatically bind
> to i2c-hid, if the dependencies are in place (available I2C adapter
> and correct IRQ driver/binding).
> The problem we have here is that we can not unbind the psmouse.ko
> binding because we can not make the connection between the 2 bindings
> from a HID or PS/2 point of view. They appear as 2 distinct mice.
> 
> For SMBus devices, currently only Synaptics and Elan have a SMBus
> binding. And this is vendor specific to know if the SMBus binding will
> be available and working.
> In the Windows world, they do not have this question: every laptop
> ships its own touchpad driver that has this information hardcoded or
> put in the ini file.
> 
> Hope that this helps.

Thanks for the answer. 
It means this scenario cannot be automatically tested.
It's unfortunate but I think doing a manual `modprobe -r psmouse` can still achieve what we want here.

Kai-Heng

> 
> Cheers,
> Benjamin
> 

