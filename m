Return-Path: <linux-input+bounces-5270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BB944A02
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 13:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F0D1C22480
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAB115252D;
	Thu,  1 Aug 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKtMbAWR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF805184529;
	Thu,  1 Aug 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510297; cv=none; b=OBNNTmDSwQ1ZCm5jQaVDzb5BVUxjt45luYh2vIlf7qxmV33x3lh6EDQdEBipVGmoyJlSkYxvyeS7REliV6QkoV2Xl5+KdQVTlUl+uSK2tpmLzDwn6LLznn08Lq93oPLCZumYye+FKhNOed1R0xwJffnPgBKOjVRbF7YpB2T+obU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510297; c=relaxed/simple;
	bh=iza3vhqSdwdlijL7CgybqUrHpvTZQGHeiXmalLsl5qI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qPg8mBRy/9AZ+JYmO16nqDjaVAjMAuFJz94AaI/6CZqCykCZd9xLZI54vea5iDMJ/Q9H5o5HzQtJFHM+b9CNLhjmGgm0BBKSeTTdRUXh+i4+AWgKhPiNEmZfUbn+9UH2waf6RdwOCUzPsA18ZgJeIQqJH2g4uBShh1ePTPDUbz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKtMbAWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1F8C4AF0A;
	Thu,  1 Aug 2024 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722510296;
	bh=iza3vhqSdwdlijL7CgybqUrHpvTZQGHeiXmalLsl5qI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QKtMbAWRsVhE2NWjMqp8q1cwu2dzSRF0gWiFItLJV1htPbnHkD6N/VEWlKXHN8qCO
	 pDxR4q7v72rXlDXInaNpX3UKd2/WwvmA/8V820nl1BU8O1Hz+q0Qkn0j4pgSdp79kO
	 ULtzlI+oqcwb/vDpvolBsTOeGS43Pw2YwWIogsaKRTuNk3M2CgY4eLHOGCWWMrjQBT
	 uUtv4iD/+rTQQvfwdgJtJdQe212kGvnT+JGeA0TWueUCBQkmh5XvVDY7NTbMDfPso6
	 X4m4rcy6T0u/v7W106+pBa2Wu3UE7VCOW0A1uW2hdZlXnN39C0sgFwV5vXBEyVxNKg
	 q6C0I93RM9sqg==
Date: Thu, 1 Aug 2024 13:04:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Camila Alvarez <cam.alvarez.i@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: fix slab-out-of-bounds Read in
 cougar_report_fixup
In-Reply-To: <20240730234242.256598-1-cam.alvarez.i@gmail.com>
Message-ID: <nycvar.YFH.7.76.2408011304470.12664@cbobk.fhfr.pm>
References: <20240730234242.256598-1-cam.alvarez.i@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jul 2024, Camila Alvarez wrote:

> report_fixup for the Cougar 500k Gaming Keyboard was not verifying
> that the report descriptor size was correct before accessing it
> 
> Reported-by: syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=24c0361074799d02c452
> Signed-off-by: Camila Alvarez <cam.alvarez.i@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


