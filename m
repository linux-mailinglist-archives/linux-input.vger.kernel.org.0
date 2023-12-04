Return-Path: <linux-input+bounces-469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E580389D
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 16:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D19412811AB
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 15:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81842375B;
	Mon,  4 Dec 2023 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QEAPVjlK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A65FF3
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 07:21:36 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-40c09d62b70so15565255e9.1
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701703295; x=1702308095; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSAKOWebFNp94GKV3HkeSU5/HPs+IMNshF27lrPuQCY=;
        b=QEAPVjlKfQHvALcsNInkV5TyV0NC5yB7lXr9Qr+7QtEuajokZCaQlfAYPd0TGuv/bz
         Blv4E8GIYhBfvBA2k108bf6tr4LUF6NZ1vHpRRxCa/f82sVKz18hamH/LTkse8s+rDNt
         kP1Bt8i9Qa5w4G/VlfweoKzX2yYk2HnzEr5V7RlCKvvRfqbadcrC8tP+h079TAZXB4Y4
         Z1O9Iu0CjtBWWhOWxROxLKRZN/e/lJrnwSn9i/x69fxY6FSSkAAz3Db18umKeQjYrwsL
         IDiA+niDuN7sk4TfdDXNpj2R5ihrZGd/4vJnHLor2fq1/xc/aUxEuIeiJHi++8t82Jkt
         KH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703295; x=1702308095;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSAKOWebFNp94GKV3HkeSU5/HPs+IMNshF27lrPuQCY=;
        b=qYlHoSWmiBmmulR0ENAoV7SvfCz8O00Q6dkgBZbB99h75pWyroBkd88olLR2C2iSmh
         DEgGgUZ5pkETvKP+gjmzd1720o6ugM7BhmjwhksbJ3veu4ZNA8mla9K7uXQiUaUd0qhQ
         kK1NHduN3l0kTTce7Cse4HvA9gloRmC9L6hYGKVqC+ljAevHY9wTyx3HivQalsk/6l3p
         wXh3SwMNjGyW9pMwI0X0XceIZPOgEcK4Xsi5Y0erpppgvvvYlBj+1nNRi1FZwwOJU6em
         pGZmiNz8JYy+ROxYDhmICJdW4WZC/zIED5umYY0orCcIZnX1b4ZRnNKT4i4flky9/W7m
         T3PQ==
X-Gm-Message-State: AOJu0YxC6PcWJKBzkd/pqYtYMgGwwieDO5TUo5djCznXRz3eT8b65Qgz
	csXhgPJIv+zsXVCP1c8qAhTklg==
X-Google-Smtp-Source: AGHT+IGetaO1EAnCnUo5mhhy4SSYh7k6kz+yUbq2YUUQIAKncCWRdjqS/v3Ss34aLpNeUsq7HOGJVA==
X-Received: by 2002:a7b:c04b:0:b0:40b:5e59:99c9 with SMTP id u11-20020a7bc04b000000b0040b5e5999c9mr1704770wmc.233.1701703294850;
        Mon, 04 Dec 2023 07:21:34 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id ay31-20020a05600c1e1f00b004080f0376a0sm15375509wmb.42.2023.12.04.07.21.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Dec 2023 07:21:34 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 4 Dec 2023 16:21:35 +0100 (CET)
To: Sebastian Parschauer <s.parschauer@gmx.de>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add quirk for Labtec/ODDOR/aikeec handbrake
In-Reply-To: <20231127224937.9407-1-s.parschauer@gmx.de>
Message-ID: <nycvar.YFH.7.76.2312041621260.29220@cbobk.fhfr.pm>
References: <20231127224937.9407-1-s.parschauer@gmx.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Nov 2023, Sebastian Parschauer wrote:

> This device needs ALWAYS_POLL quirk, otherwise it keeps reconnecting
> indefinitely. It is a handbrake for sim racing detected as joystick.
> Reported and tested by GitHub user N0th1ngM4tt3rs.
> 
> Link: https://github.com/sriemer/fix-linux-mouse issue 22
> Signed-off-by: Sebastian Parschauer <s.parschauer@gmx.de>

Applied, thanks.


-- 
Jiri Kosina
SUSE Labs


