Return-Path: <linux-input+bounces-11278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2AA70BB4
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 21:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E17E3B3F31
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 20:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89162266B7E;
	Tue, 25 Mar 2025 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EXJb42kg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2DF266B4F
	for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742935314; cv=none; b=ps4HQdtpVAKYQglm3r9Z35LREO7T6cLpwT5fb3e2KK3iaRYXv2F//bbGHHE++Xue+5dK9pwjH5Uf2ldSnGN7A6AS8IGXJawdh9uYlat4qPtUPJ/eL3VNFSmjAqaFXlPvB+CiWgbc4Q3NWTxMj2h83S9uJ53p8IEFfzLIt+YI8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742935314; c=relaxed/simple;
	bh=GCAhGVtueceq1ubCUXU7aIifbCxnCpAKEuI8oUAtt/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr0cadRGLQrY+s2qm8adJKsLwlt3erWFKpPqvw4HunCbxqeKAc3eg8KDS4i5wtBHGkRu0BDPzIMWunM4XyFK9AHZhc/jgbGcIePt9fVG2YgUkWG+tK0fRDWofLKdcsfq6GycDTVFuO3BkEF1pM3KIZtZ3CsyxF+FZEHA9ZDx/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EXJb42kg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so1025709866b.2
        for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742935311; x=1743540111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=EXJb42kg5HAc6tmyKr5oRY94sG4sbt/CcE2UJmPlqnN7iVY0JglgOH9+r6DRxzSSwb
         NiOrl5WwHztozS0ovw28py2Y9tqC+Et/ztdMCM4v+wvon+xs26qMSaYJroYzspue2WKO
         Y9j68gg01vakh3TWaBnStui40sFXXxQo0HSBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935311; x=1743540111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=TTqxogKhE4mrAZ0IpYWiVVCfwDhppdTGCxq0Z2mnJKCFBbXz8Kvp1B6FnZLU41wcM1
         YI8mwdhT4gEdqLeXS+ugxQq7qjoxarywq+3oytb7Q/jaWS1kpn/nNTIc/oQRMHFhUu2y
         EZRQafx/Y4gVf/gnWj/k2El3U1hsm9p29xuG74V1O8vIjiLD+0K1RQZRyfgwi7Ry/v3i
         Gp4JsUfTbKyQviuM6vXsO1dp1MIEklmJldV6MCtX1kRJVqSE6FfbLz7IBhuc6xWhAgzN
         GwRpje2+/IFRbZgpTvHJ0v7dEvSZ3m54rLEIMkgzbrdy9tLaqosx0vo1cUHe9qlS5JFQ
         Kugw==
X-Forwarded-Encrypted: i=1; AJvYcCXHLbpnQ6YkcTnTGonwaBGV+OEiunpAmzff9pP2Ga1apRevsrW9NjUiJniRgCKvpGnPFK9b4J7pBjGcsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjfPQvl2IrjoYC+UqaJ3zovJo57oBqH9hcbQU4coHAqB0qXJLE
	7+/bvQ4Rs+eYKmoW9QR8a+ttzzASDR1Y3SflJ644eWmx2hi7eLhERKnpFplOQnHWP8hv8EEaLXa
	S+Kk=
X-Gm-Gg: ASbGncvWWguBucV87eBrIbBtAOL2Hn0eYuBq4NW3IaaGss4wg8VsCfsui1DObohWPvG
	i6aveuIRRYQsev8tYQjZ7Tp5+us0AGBijfbpi8mUghDbBxqhdKYOs5FfcJZA1o6+ErHR9RM+LjS
	/3Vqz1L+OfBf9Uy6D51LOzyEdNcaNie88IsuEToDZL5kzLii/LdYj4Kb/SjgpMy/vO1u/FRJANL
	4qzD88p36K2pDVQWEUuEFeEeMu5GIasGifZzPbvgu3faxjjcUHeKyzKir4+E7Uth1NmGNYD3WHU
	IfXOntqA+aAA1uBR11eLovvBA6sOhNsaldNwvnU6urHysSd+g1BDQGMG3Q2yTdVc3AKwf1FeyJt
	onIXDO7WzYmU4tEzIvyk=
X-Google-Smtp-Source: AGHT+IENDWobkpnfOBOYk0B13fG8tqnY1m1m/xJUQUVmrL9Yx3fkJ9Awne2WaUI2NcovFUHlZWLxrA==
X-Received: by 2002:a17:907:bc8b:b0:ac4:4cd:c26c with SMTP id a640c23a62f3a-ac404cdc6eamr1563336266b.35.1742935310604;
        Tue, 25 Mar 2025 13:41:50 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb658f9sm905691366b.120.2025.03.25.13.41.48
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac298c8fa50so1056672466b.1
        for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFygTfq9FJY6s3hy2k4llGdhg0vfqlbZDp1jmxfX0x8felQ2rAsxywT2jX1KS3y8lKk7KXmJ1dxI0n8w==@vger.kernel.org
X-Received: by 2002:a17:907:95a4:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac3f27fd3b3mr1859596466b.48.1742935307883; Tue, 25 Mar 2025
 13:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
In-Reply-To: <20250325121624.523258-2-guoren@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwFc7ifwGuAhyrs4E5qPgHx1McCR38KFycRhkLFRMKTveHrmoaWi4zba4
Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>
> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
> leverages the lp64 abi Linux interface. Hence, unify the
> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.

No.

This isn't happening.

You can't do crazy things in the RISC-V code and then expect the rest
of the kernel to just go "ok, we'll do crazy things".

We're not doing crazy __riscv_xlen hackery with random structures
containing 64-bit values that the kernel then only looks at the low 32
bits. That's wrong on *so* many levels.

I'm willing to say "big-endian is dead", but I'm not willing to accept
this kind of crazy hackery.

Not today, not ever.

If you want to run a ilp32 kernel on 64-bit hardware (and support
64-bit ABI just in a 32-bit virtual memory size), I would suggest you

 (a) treat the kernel as natively 32-bit (obviously you can then tell
the compiler to use the rv64 instructions, which I presume you're
already doing - I didn't look)

 (b) look at making the compat stuff do the conversion the "wrong way".

And btw, that (b) implies *not* just ignoring the high bits. If
user-space gives 64-bit pointer, you don't just treat it as a 32-bit
one by dropping the high bits. You add some logic to convert it to an
invalid pointer so that user space gets -EFAULT.

            Linus

