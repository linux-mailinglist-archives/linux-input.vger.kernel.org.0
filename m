Return-Path: <linux-input+bounces-728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0E80F3CD
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 17:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 058431C20A67
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378FB7B3B0;
	Tue, 12 Dec 2023 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IT3he8N5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B581E101
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 08:57:27 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1ef2f5ed01so733732466b.0
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702400246; x=1703005046; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lMTVtJ6H9PCFimJOMBMX+fMUzbTEUbpPe5aIJIvTUQ=;
        b=IT3he8N5E6dzwaqyZv2UvEjBZPbBJwZY7fDL/dAUPYKceWoJttaXBculDICYSQgvsK
         8/I3wr7pQ+xjzAnG/Kexvjstp3uWRMrkNI+p5LoUYVLkFCeYXjQCd2lwfDn0+W0zw1Vd
         ZWl46ikAkTtK6d+4HlnUBehhSL39oaXf/Z2kewJSQGwf7JOXk+VX9pclUPE3SR6MTuEQ
         hdqU/q43voZm7ZVfE4kjwEgKk0vP2fAhRW3PjHPHPfstCj7HM3KrIr8YHQ8GqyegsSJZ
         glkB7sg+VufnU0vldoJtoJ3EKmCmRCbDbf3+5V4LmqLHf0/g9zSqmFzqxNkCt2tWHiF2
         OoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400246; x=1703005046;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lMTVtJ6H9PCFimJOMBMX+fMUzbTEUbpPe5aIJIvTUQ=;
        b=s5rHdm1sV0nQf/O2QeFWPRTOJbT/NH1WwypZ4RwFKXuNIQkMkHkaVR1mwvDdHr7hpg
         elieLfWwzWGEjI91tcJExB+NkbWrxPwY8dLqULiRKO1Op9DEQcOAD7vSVdYN7/Fdbc0v
         LIx5CihUYyWUxANq4/4xrwQ7XAJ8jhzYw0Gj0xhq+tc4IeKyD31Ca0Swtl/dx65PIE1n
         ZkL52n9pmYvlvKoykxn8wJ41lgWXWXycr8az9Zqr2BzYAsZ4Ssot8tXLGkrJxBNfu1yG
         WG/PQ8qGEDQsKYzDT9raYmP3fVkld4jjW76qWRSHZcJBOHoNtq6YSfbqzWmc+jU4Ecah
         V0Ug==
X-Gm-Message-State: AOJu0Yx7aOT9AFZX7IzRYZ3C7xhaeE+I+wW9Ebm3jZkSW+GTgQO/tg8u
	c1bOE7vyU3AsZ5eJzF2Guo1uhQ==
X-Google-Smtp-Source: AGHT+IGfbuCInx3RFO2rETPGTleTrH3IgAr8XT2Yzv//r2Wg7OvimKJNEBvV3fpuGej4OApyjNJRNg==
X-Received: by 2002:a17:906:3f58:b0:a1d:3858:9c66 with SMTP id f24-20020a1709063f5800b00a1d38589c66mr1813082ejj.171.1702400245950;
        Tue, 12 Dec 2023 08:57:25 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm6592557ejc.18.2023.12.12.08.57.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Dec 2023 08:57:25 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 12 Dec 2023 17:57:26 +0100 (CET)
To: xiongxin <xiongxin@kylinos.cn>
cc: Thomas Gleixner <tglx@linutronix.de>, benjamin.tissoires@redhat.com, 
    linux-input@vger.kernel.org, stable@vger.kernel.org, 
    Riwen Lu <luriwen@kylinos.cn>
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
In-Reply-To: <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
Message-ID: <nycvar.YFH.7.76.2312121755290.24250@cbobk.fhfr.pm>
References: <20231207014003.12919-1-xiongxin@kylinos.cn> <87ttosssxd.ffs@tglx> <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, xiongxin wrote:

> In this scenario, unmask_irq() will not be called, and then gpio corresponding
> interrupt pin will be masked. Finally, in the suspend() process driven by gpio
> interrupt controller, the interrupt mask register will be saved, and then
> masked will continue to be read when resuming () process. After the kernel
> resumed, the i2c hid gpio interrupt was masked and the i2c hid device was
> unavailable.

In addition to what Thomas already wrote -- what exactly is the problem 
you are trying to solve here?

Is it that your device drive by i2c-hid driver is no longer sending any 
data reports after a suspend/resume cycle? What makes you think that it's 
because of its IRQ being disabled?

Don't you just perhaps need I2C_HID_QUIRK_RESET_ON_RESUME quirk for that 
device?

-- 
Jiri Kosina
SUSE Labs


