Return-Path: <linux-input+bounces-436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF080304D
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A8DBB209A7
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4C9182AF;
	Mon,  4 Dec 2023 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MqK9/XnG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E310A85;
	Mon,  4 Dec 2023 02:32:33 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5D5D340E024E;
	Mon,  4 Dec 2023 10:32:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RRUUekAD-ipx; Mon,  4 Dec 2023 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1701685950; bh=nWocH48nXEMQ/OP6xMY43JWJh9FkgJtDNpCaPQAMRJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqK9/XnG59Dx693ynS3g9Lj2a7V8bQ/B074NKGBFeNeBHJLZvLzUhPKO6qsOdVbsX
	 01Jgo11UDmS1lqE/jbWRH/syLhoaTQK9bLHes/38rqTxQLsacOXBX8y6+9JNAr9RM7
	 jtTPKawONkgv8qMFjcaojLAB43OfDOwHJ5eG7Fntnif59GOE9wGZUrCHim9Xtgq1l5
	 S2oYKGEAqLamuW5BAhhZgz5QLzZMeRtz56l6XBGrixmPCnrfVVSSHTMGpXzcaP4Ns0
	 vDKEQhfraxMIRRfhOT9C51WcCPOSQU0kbTZ9pjSrpxseLFfGzwEGQM/8wBqYslSArl
	 EDcvgmOo+u8ZRg7K+sJTGnMEFWv7SpzyLvxHldCPYyb6SzgD31JsLLDyxEFaqc2MO4
	 8IcGk+815PW2gRLWRBJbtKbd4l6AnYMkzSTrNIASKCFG+iUyaHRfediSLdthhsq4Kw
	 pZ6/8gpm96FFtrYh9SjOlw8CtGzsVKd6nLqiLCLT1ehUbTc++06XWJjy5XiNXo/ZAh
	 cKs89UEN0/0pNuwNdbd1BZO+WL4jKLqYhdRJ8j6BFGWjdfNKr1v02QgMfnL5KWFwi/
	 MEEbfpsK5TYaGzWpx67/zBnHnWrZARgOmpliA7ch8iKRuTEGZwTkMWUonIhaWq9vae
	 5XwfJ7mNWI12voU+sV8spAgw=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6E1FD40E0277;
	Mon,  4 Dec 2023 10:32:03 +0000 (UTC)
Date: Mon, 4 Dec 2023 11:32:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <amakhalov@vmware.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
	netdev@vger.kernel.org, richardcochran@gmail.com,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	zackr@vmware.com, linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com, namit@vmware.com, timothym@vmware.com,
	akaher@vmware.com, jsipek@vmware.com,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, horms@kernel.org
Subject: Re: [PATCH v2 1/6] x86/vmware: Move common macros to vmware.h
Message-ID: <20231204103202.GZZW2qovY98FCgKNax@fat_crate.local>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-2-amakhalov@vmware.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-2-amakhalov@vmware.com>

On Fri, Dec 01, 2023 at 03:24:47PM -0800, Alexey Makhalov wrote:
> Move VMware hypercall macros to vmware.h as a preparation step
> for the next commit. No functional changes besides exporting

"next commit" in git is ambiguous. Get rid of such formulations.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

