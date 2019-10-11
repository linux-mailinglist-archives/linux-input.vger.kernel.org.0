Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D40D3C7D
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 11:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfJKJf3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 05:35:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48048 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726585AbfJKJf3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 05:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570786527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5+rZMxTuWI8enqhJKUpLChExmsxlqyqKC9Pp+XJ71Es=;
        b=bR3pxNE/lhZ88kRPIUypUpCGVnuTlcLN7t8i4o+q31MeuUT5ytoHZkL759mNV96OxUr9QO
        z7nGplRIbeyXW1iZ8sEcJZuE2wstCNnMRHJleIpkgoa7eOkauW+Im0/K+13bQN+tw31aqd
        3uHPwVPn/cErn1IGVnljl51tlTrzgEQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-SIQS_Gn5MGyrY_Wovu5yGw-1; Fri, 11 Oct 2019 05:35:22 -0400
Received: by mail-qt1-f198.google.com with SMTP id m20so8783025qtq.16
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 02:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcrRu+nzTi00IewgHhj4yPzJ87RltdhDiJTPZurcn+s=;
        b=GasjfOzFDTQqqnGleCcoD8oqTKdmlTu4S8ZD5huZFsuGxOIwB00vTZgG5Jvpe9aA7H
         gRV/ZnhiD6efw4/9B2oFfXUcGN5FDfLpdV4ZmJRoXRkMKKDTlh9AgYn5hQVdhlvSlSKD
         t5brLZLv0YeIw5klMq+8iDIvtSnFG/lxVtei2efoRf5z/ihQlmQ+ngbTj8DrEX22HfZs
         G/03wqxuSTCWEHAEYP08Dq9QWgvsW2Cv21zvWVVzR1s2+AqWbCZeqmcUc2FqyHw1wqPa
         I+BPSUI+su/jW+MoNZ3GAo9/JmLlT7PS1zX5P1TN1UiEC5yUq+29BzdWo50WF52/Lgvs
         WrmQ==
X-Gm-Message-State: APjAAAVledV/J/wm2sXBTXnKQNnzflUBWG+sBCiu1tMoIS8OFDSx+o84
        xFzi2hqXnKPPIvwAyMTkxa8CHPDr52iv48dOATaFmFv267lxZhdb+Nnly8S2iCyNg3P9nQCHuTb
        WRb73WhCs3yOl7wGLT1/3KiT5hXNQC/RI7+ZHAv8=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr15714018qtm.294.1570786521727;
        Fri, 11 Oct 2019 02:35:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDyO2W1tS0VUHNpUpsHHGKsbIIqN+mRKAnxEXavdtPgPIKJrGjKXwmCmUenwuqL0jxLWT7zDr1ZT+KiX23KwE=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr15714001qtm.294.1570786521539;
 Fri, 11 Oct 2019 02:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <7DD64ADB-478C-408C-873D-C07186FEB65F@canonical.com>
In-Reply-To: <7DD64ADB-478C-408C-873D-C07186FEB65F@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 11:35:10 +0200
Message-ID: <CAO-hwJKrZVUPL_=KrFNhzx8S1TP2M6zUEM_Ak8m7ze-1b9cTMA@mail.gmail.com>
Subject: Re: How to make sure touchpad doesn't use psmouse.ko?
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        ray.chen@canonical.com, You-Sheng Yang <vicamo.yang@canonical.com>
X-MC-Unique: SIQS_Gn5MGyrY_Wovu5yGw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kai-Heng,

On Mon, Oct 7, 2019 at 9:45 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> Hi,
>
> When we are enabling a new hardware, sometimes touchpad may still use psm=
ouse.ko due to bugs or missing IDs.
> Is there a way to quickly to determine the touchpad doesn't use psmouse b=
ut something like SMBus or HID over I2C?

Quick answer: no :)

For HID over I2C devices, they have to be included in the DSDT, so we
can detect those at the ACPI level, and they should automatically bind
to i2c-hid, if the dependencies are in place (available I2C adapter
and correct IRQ driver/binding).
The problem we have here is that we can not unbind the psmouse.ko
binding because we can not make the connection between the 2 bindings
from a HID or PS/2 point of view. They appear as 2 distinct mice.

For SMBus devices, currently only Synaptics and Elan have a SMBus
binding. And this is vendor specific to know if the SMBus binding will
be available and working.
In the Windows world, they do not have this question: every laptop
ships its own touchpad driver that has this information hardcoded or
put in the ini file.

Hope that this helps.

Cheers,
Benjamin

