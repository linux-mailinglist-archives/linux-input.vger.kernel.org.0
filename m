Return-Path: <linux-input+bounces-199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAA7F43BB
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 11:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780D5281483
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A87651020;
	Wed, 22 Nov 2023 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9AbEBhV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132094B5A2
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 10:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBE3C433C9;
	Wed, 22 Nov 2023 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700648731;
	bh=YcBYpnCa+wkhXfDEX/YvQLtmcej4A0EtnL4uPGNb79A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M9AbEBhV74MsAV+sbu/RZaUqRXZRqcx0u90OD5OVpO1NpvfQJiPcMMzNYhtXBtzMy
	 VGnYVx5KrEWFiqWD2E2wYhmTIcJ3uMAzag5/Xcl0BvMJL5U+N8cC4m4tmrnmWjRLyr
	 QhnSWI2L5fxZpFzg7MBCjbpdtFsVLEnZ08erif+3wSklDMsrp0h6RGf5t8nh+HR3A4
	 iKpOKB02TGfOYXPLi0N8q/XjTKS9Cp/BeDCNJBmYtSc4SppOq79WV1b93jpcIix5vw
	 rUCARA6OJwmlK/AHEdgdogbvbTS58qamUUT6Ki9ebhouuyVLbzuPfvUEUwo4wtvKy/
	 5B11dZRlKJVPw==
Date: Wed, 22 Nov 2023 11:25:28 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Luke Jones <luke@ljones.dev>
cc: Denis Benato <benato.denis96@gmail.com>, benjamin.tissoires@redhat.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hid-asus: reset the backlight brightness level on
 resume
In-Reply-To: <MRNH4S.965MCNIAPCDV2@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2311221125221.29220@cbobk.fhfr.pm>
References: <20231117011556.13067-1-luke@ljones.dev> <b4356286-368a-49ec-b1f8-d7e5e4afdc25@gmail.com> <nycvar.YFH.7.76.2311210951340.29220@cbobk.fhfr.pm> <MRNH4S.965MCNIAPCDV2@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Luke Jones wrote:

> >> I want to express my gratitude toward Luke for his guidance and his help
> >>  in submitting this fix.
> >> 
> >>  I confirm those patches were sent in my behalf.
> > 
> > Luke, as you were in the supply chain of the patches, could you please
> > provide Signed-off-by: tags so that I can add them into the chain?
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


