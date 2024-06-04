Return-Path: <linux-input+bounces-4077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945178FB4FF
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 16:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31374281220
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FBC381B0;
	Tue,  4 Jun 2024 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQTUbCPV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72DC182C5;
	Tue,  4 Jun 2024 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510522; cv=none; b=itO9r+XWDLZRbNh1Ss0v/cYlDVfI6JOlZLHNXJ53J86bheXM3Fg/OZt2f/INM2t4izvqe3SrXPNRclTLhXekSY4OaQLeLkJtuBQN5ddHXS6/HfPPPij5K8MIQKsxFNxXUd4k5krVn6RcbL0zhVTJENe9HkBkzMFUacYPBntoP74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510522; c=relaxed/simple;
	bh=dCYwA2T+wZ6B5AlnOfH1EZwq/LhU73DxcZwcbP3J1KE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mM13mTLBXSm96Nst+Gm9rxGsOsx3zqDQFem0QoF/V00kQvr2swPPXB2n1ToHsYUACNyb6kCQeEya4e000TjytXHBXhWIxkX/rba7tpzHdXyVZrgPatEE5ozI20UK0oL/Gt30AtbIJovGaVsVsJscYciXz1Zo60DqENBvnhf9/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQTUbCPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002F2C2BBFC;
	Tue,  4 Jun 2024 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717510522;
	bh=dCYwA2T+wZ6B5AlnOfH1EZwq/LhU73DxcZwcbP3J1KE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hQTUbCPVJi1r+pUQWfOjRlDqPUhoGDRQjxa+eKN7HETb6j5lHyQLuQg0n4y4ohkI6
	 ZXTmSRrZ7fwSaVoyympC+8a7ifj+PDFnJF6UY/oW6GT/kYKHrRK/eOME5MrsvqzTFk
	 BUh0/XDSGSPQhhorYMHqCsI6HQ2wuS87eptzS1bdw+nZ9RZN3hocTuVMbluB1iUqJP
	 Xy6rhCLaVhHsbrMmbNVlyjAI9FYHUWQyC0Gh2fFEPYsLvCIPA5UIkpKqwAEASNVXep
	 U142C/fpa2VN3hjdZ/szAaBBA9mglxngccRNPu07+/5PJmwnpW8iM4F/RIE4UQgOJF
	 gpmLOgBf7pK6Q==
Date: Tue, 4 Jun 2024 16:15:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kees Cook <kees@kernel.org>
cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, 
    Benjamin Tissoires <bentiss@kernel.org>, Kees Cook <keescook@chromium.org>, 
    linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
    syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, 
    syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com, 
    linux-hardening@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
In-Reply-To: <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
Message-ID: <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru> <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm> <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jun 2024, Kees Cook wrote:

> This isn't the right solution. The problem is that hid_class_descriptor 
> is a flexible array but was sized as a single element fake flexible 
> array:
> 
> struct hid_descriptor {
> 	   __u8  bLength;
> 	   __u8  bDescriptorType;
> 	   __le16 bcdHID;
> 	   __u8  bCountryCode;
> 	   __u8  bNumDescriptors;
> 
> 	   struct hid_class_descriptor desc[1];
> } __attribute__ ((packed));
> 
> This likely needs to be: 
> 
> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
> 
> And then check for any sizeof() uses of the struct that might have changed.

Ah, you are of course right, not sure what I was thinking. Thanks a lot 
for catching my brainfart.

I am dropping the patch for now; Nikita, will you please send a refreshed 
one?

-- 
Jiri Kosina
SUSE Labs


