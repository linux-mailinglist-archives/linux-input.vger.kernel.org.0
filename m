Return-Path: <linux-input+bounces-156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7A7F27BC
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666BE282898
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FD8F4E7;
	Tue, 21 Nov 2023 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8dNPHPb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8B4A2E;
	Tue, 21 Nov 2023 08:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037C0C433C8;
	Tue, 21 Nov 2023 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700556170;
	bh=s42Wy/PSgBWqU30V33nYxLqE/eIP2AdBSScg2nPIBSg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C8dNPHPbzqj9qpvY1zxJ6ca77mO30Jo11bL5O30YdbgImcCAvuV9HhdaoU8B57Fas
	 6zr4slaeRrxKi2d/pyApKrjLoYmm+PWE4g+z4wCeSJvyXDAhoNk8vHZo+NJ+jegt6d
	 vCOJntjmUMNzA3lWHr6WAx402mlHmkq45jp+4bUypQ+OtUJBGXzQqBXrfOrdlrFw/5
	 9S+REn7ea+O9GBmXVYuBOfig+ATPZ4fagDAGsPVtzAmXW2bCakKhLtXzquFQa6PQQk
	 86K+9Z1/dwRix/rhxBYVQYzJ1x/kPHK/o93Z3Ztkjr8EiOo51Rfg4TdfW5fJiv7RDa
	 pMsseDWJqL3Gg==
Date: Tue, 21 Nov 2023 09:42:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, 
    =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-12-tzimmermann@suse.de>
Message-ID: <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>
References: <20231115102954.7102-1-tzimmermann@suse.de> <20231115102954.7102-12-tzimmermann@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Nov 2023, Thomas Zimmermann wrote:

> The picolcd_fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org

Acked-by: Jiri Kosina <jkosina@suse.cz>

I guess this will go in as one series together, right?

-- 
Jiri Kosina
SUSE Labs


