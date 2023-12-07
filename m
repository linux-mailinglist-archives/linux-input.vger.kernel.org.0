Return-Path: <linux-input+bounces-596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6C80898A
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 14:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87B4D1C20C64
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 13:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7F140C10;
	Thu,  7 Dec 2023 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fEQmh4R4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B82810C2
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 05:53:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33348e711e0so972716f8f.1
        for <linux-input@vger.kernel.org>; Thu, 07 Dec 2023 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701957222; x=1702562022; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCfngSAlIwqEXssY2pmSdDNSAL/XaZG/lzXesXtgYIo=;
        b=fEQmh4R4RmIcaXkrvGb81zl9JmU+y4xrzTgeCBuXAIkdHKWin9WLJB/n/viKDwg3dP
         bIUXx3ckTE2mJsUklM5rh+7o0JQ59CezeOXIRXAIkfZ7P7+UmPUcTFVRqdHGUS4W8L8z
         2ISyf15P8mOFav6Ua5AFQBUXsSyWs8iYH53kPOyjPYZPVMYL9OXZt/iAPxxHM9o/zgQ7
         l7YqiJ/0s9tVIJTMlTWW361NuOYBYCBVfP13wFODVPw+nQH3njnplGvuAXDp9Z4aw2pc
         CQUM8LgzQe996Rb0F6R2/M4lNRlaxT2lgznJiiCmSEIR8JCAQdtlKWHZg6BnwuhUH1M7
         M0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701957222; x=1702562022;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCfngSAlIwqEXssY2pmSdDNSAL/XaZG/lzXesXtgYIo=;
        b=IvaOeBXReQTepddqiKozUliS0Rrc8KXio8GvAPe92JBEnLfnjvWM2024Q7o2sctxJH
         TdnbCq+5KqZtNGVPDaQyvDDLs8NCLyQSF3iPUhfqWe/tuFKAOMmjdKInzzrIoBkaO+SH
         RlRs980o2zUXa+6BtSdHuDwylgB//si1ohGbOLwzgn8qaa/E0JRyA3dr7YW6IWRsmQ5M
         udB6Z0jaXgCsuUomr1eNLohU8KxV2ycrNKX6ZHK+MxnsFbnk21Timi8WdW1tQ9zySC2r
         XZdRdYRgtCxsEc6CtQJUiPRChdWixVX64bBSPhOkHNEfMkDrPb3XtYNSmAf2f423udYi
         2i0w==
X-Gm-Message-State: AOJu0Yw0XOHJulXRr+yeMJ8THZjoeO7JTd1FTul5ALaYNuoU6NxDP/2F
	64m3NoLCuQuDaRnuO+40fjuRMg==
X-Google-Smtp-Source: AGHT+IHfIhZ9GGAZ8MfZ3L3Ia3csFxydF02wtcAFIuRc7oZemDBZE6mMuWwcwbCzPvAhz1n0wfu+/A==
X-Received: by 2002:adf:f50d:0:b0:333:6435:a0e9 with SMTP id q13-20020adff50d000000b003336435a0e9mr1633119wro.79.1701957222529;
        Thu, 07 Dec 2023 05:53:42 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id w8-20020adfcd08000000b003334675634bsm1509505wrm.29.2023.12.07.05.53.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Dec 2023 05:53:42 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 7 Dec 2023 14:53:43 +0100 (CET)
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, benjamin.tissoires@redhat.com, 
    linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
    Jian Hui Lee <jianhui.lee@canonical.com>, Even Xu <even.xu@intel.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: intel-ish-hid: ipc: Rework EHL OOB wakeup
In-Reply-To: <6776742e5aba8f9f10c661a7876eb252f4ac7745.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2312071453340.29220@cbobk.fhfr.pm>
References: <20231108121940.288005-1-kai.heng.feng@canonical.com> <6776742e5aba8f9f10c661a7876eb252f4ac7745.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, srinivas pandruvada wrote:

> On Wed, 2023-11-08 at 14:19 +0200, Kai-Heng Feng wrote:
> > Since PCI core and ACPI core already handles PCI PME wake and GPE
> > wake
> > when the device has wakeup capability, use device_init_wakeup() to
> > let
> > them do the wakeup setting work.
> > 
> > Also add a shutdown callback which uses pci_prepare_to_sleep() to let
> > PCI and ACPI set OOB wakeup for S5.
> > 
> > Cc: Jian Hui Lee <jianhui.lee@canonical.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, applied.

-- 
Jiri Kosina
SUSE Labs


