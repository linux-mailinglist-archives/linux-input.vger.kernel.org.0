Return-Path: <linux-input+bounces-513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A748061E2
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 23:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECDF0B2119B
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 22:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363B43FB30;
	Tue,  5 Dec 2023 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QfZxWlKs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9B41A5
	for <linux-input@vger.kernel.org>; Tue,  5 Dec 2023 14:43:28 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce32821a53so2043716b3a.0
        for <linux-input@vger.kernel.org>; Tue, 05 Dec 2023 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701816208; x=1702421008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5PDjvnXiofAm+LfrZr5GVjzdYbiyiT62E/CMkJfzm4=;
        b=QfZxWlKsHMlPcqy9Kt+NlA82ZbgqK7VVPUBj50xMjomFqi0DrN66LhIjiZCaiQnCmc
         wxlKmRlSImP4+A1h+jCW63Baq6M3r5zGaiNsVQaNY2PokzeDJGVImg1pDxQToXNv7O2x
         FCDL1Hdqs/fxziQB78yMWtxDAKvGOA092rBMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701816208; x=1702421008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5PDjvnXiofAm+LfrZr5GVjzdYbiyiT62E/CMkJfzm4=;
        b=uu2l/A9chHj5DEm7U3YA3hvgkrvXkD3s2rE1WzbWDCmRXbnW8croaEzYLGqGmcJAWJ
         V4f1mvGYpj1NngnZmInHsrRqSf09oShMbkiZ0EIK7xvohX9dXkQQPK7Tl62jmTVWmAMV
         5BWqj5BmcFwVOk/8+wb1RhcB5Tby1oskTKmvRRjFTTIqO6IxmQ81uq/lolGLL1jLaf66
         3WkJnGEOUpiMp6nTY0uGUDumZWEKMUpTkfZ9ELkv/Ezd29kCHTPuIv30HZCec9Kv5s6y
         55j2TQrIhfSt9gnZUC/hDEGkCW6z+b6dh8uF00m10bbsUwwPTXpyWq+Tz5r5ZV2UPToi
         GJ/w==
X-Gm-Message-State: AOJu0YylyzpgtZNSp7/dM9RAu4JxC9UntFvfBhhuxKtuPO8n3qszS8GT
	xeBmxNt2yp36ix3AGqeX+wIU+72ylrBjI50PgruYvUT2C65YDAXGf7h0MBRBh37jndBRLvCcbup
	6rSiHEjfvzxxlkx/1aBiCTGXzIFwK+A==
X-Google-Smtp-Source: AGHT+IGLyjhmShxcrztf4iUASVXKLIZrQvbl2nOMjR/Yv9SysVtwrvaOGSlk/eSVNbluuvrw8muVoWkRUp1fFXY/kkM=
X-Received: by 2002:a05:6a20:1608:b0:18c:b6:ab4f with SMTP id
 l8-20020a056a20160800b0018c00b6ab4fmr4318468pzj.48.1701816207958; Tue, 05 Dec
 2023 14:43:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122233058.185601-8-amakhalov@vmware.com> <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-7-amakhalov@vmware.com> <20231204103100.GYZW2qZE9tbGMtuVgY@fat_crate.local>
 <c2519c9a-8518-403a-9bca-cb79a5f2a6e9@intel.com> <204f743d-2901-4ad2-bbcc-a7857a8644e7@broadcom.com>
In-Reply-To: <204f743d-2901-4ad2-bbcc-a7857a8644e7@broadcom.com>
From: Tim Merrifield <tim.merrifield@broadcom.com>
Date: Tue, 5 Dec 2023 16:43:16 -0600
Message-ID: <CAJfbqWyeubVofe4BHQC+a3wacwk0kMPECa8mxZ7gkzhBJ3d5LA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Alexey Makhalov <amakhalov@vmware.com>, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, hpa@zytor.com, dave.hansen@linux.intel.co, 
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org, 
	richardcochran@gmail.com, linux-input@vger.kernel.org, 
	dmitry.torokhov@gmail.com, zackr@vmware.com, 
	linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com, namit@vmware.com, 
	timothym@vmware.com, akaher@vmware.com, jsipek@vmware.com, 
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com, 
	tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave and Alexey,

Regarding VMware-specific checks, it may be beneficial to add some
additional checks
such as ensuring that the hypervisor vendor is VMware,
r12=3D=3DVMWARE_HYPERVISOR_MAGIC,
r10=3D=3DVMWARE_TDX_VENDOR_LEAF, r11=3D=3DVMWARE_TDX_HCALL_FUNC and r13 (co=
mmand) is
restricted to those few commands we expect to be invoked from the
kernel or drivers by VMware-specific
code.

If we add these checks, would folks be OK with exporting this function?


On Tue, Dec 5, 2023 at 3:41=E2=80=AFPM Alexey Makhalov
<alexey.makhalov@broadcom.com> wrote:
>
>
>
> On 12/5/23 1:24 PM, Dave Hansen wrote:
> > On 12/4/23 02:31, Borislav Petkov wrote:
> >> On Fri, Dec 01, 2023 at 03:24:52PM -0800, Alexey Makhalov wrote:
> >>> +#ifdef CONFIG_INTEL_TDX_GUEST
> >>> +/* __tdx_hypercall() is not exported. So, export the wrapper */
> >>> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
> >>> +{
> >>> +   __tdx_hypercall(args);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
> >> Uuuh, lovely. I'd like to see what the TDX folks think about this
> >> export first.
> >
> > I don't really like it much.  This does a generic thing (make a TDX
> > hypercall) with a specific name ("vmware_").  If you want to make an
> > argument that a certain chunk of the __tdx_hypercall() space is just fo=
r
> > VMWare and you also add a VMWare-specific check and then export *that*,
> > it might be acceptable.
> >
> > But I don't want random modules able to make random, unrestricted TDX
> > hypercalls.  That's asking for trouble.
>
> Considering exporting of __tdx_hypercall for random modules is not an
> option, what VMware specific checks you are suggesting?
>
> --
> This electronic communication and the information and any files transmitt=
ed
> with it, or attached to it, are confidential and are intended solely for
> the use of the individual or entity to whom it is addressed and may conta=
in
> information that is confidential, legally privileged, protected by privac=
y
> laws, or otherwise restricted from disclosure to anyone else. If you are
> not the intended recipient or the person responsible for delivering the
> e-mail to the intended recipient, you are hereby notified that any use,
> copying, distributing, dissemination, forwarding, printing, or copying of
> this e-mail is strictly prohibited. If you received this e-mail in error,
> please return the e-mail to the sender, delete it from your computer, and
> destroy any printed copy of it.

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.

