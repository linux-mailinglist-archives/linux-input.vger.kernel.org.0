Return-Path: <linux-input+bounces-6252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97796DC59
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 16:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF4928AF41
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 14:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0654338DC7;
	Thu,  5 Sep 2024 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsUyhyii"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3904CA64;
	Thu,  5 Sep 2024 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547769; cv=none; b=ld+ZSud/eXpmiuq5Rc4YQ7pyVXB0uxlGo3BpyEL5ztL+L+1M93UnjRKeG+GQoPZ83JDkvnQAhxHxOII8tX8vfg5ppkvw8UjpLo+NXM1QCI4G0TLV2wzGDG2jUstcLh46LvGYR5fxKpnFgXMf42Xtg6vwOn8VKZFjVj7mQkZ8WHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547769; c=relaxed/simple;
	bh=b8KBDddln4wY9dI5lXetH7P6iO5i+450G8lG47m1FrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PsO2anY5vJJuDO+zd0WH/DdPXlB5J688rk786eexg2W8wIEMyW9S+geaN64jJpFZRM205VI1AuhPEZce427EVZAieCA4FQKHafbAcFMnztGFJV3FHCcQsGOk+KwB41xMPnv8yZSDf29aBObgyVMvbfzWL54HJG0a2o23MJYt2w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsUyhyii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45277C4CEC5;
	Thu,  5 Sep 2024 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725547768;
	bh=b8KBDddln4wY9dI5lXetH7P6iO5i+450G8lG47m1FrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hsUyhyiiaMX92aEHzoe2h5Aip9s1cu/R6xGQ47j5ybi5i809BGCZYBe5J35aHmq/4
	 qwPFTkaKRlBHFYBbctOyYuoYkLFATdNGEV7vqWvTI8Yy93GGyOan5nMxSQc0ajV8HZ
	 /ywma8FXVpKeAHsoK0aXIbz02wGglI713JmP1sfsf+j322J+4/MXG/HdtmB1gjCsa/
	 SbA2EFlbi56qvK10zVq/747wLfwywC7WVRW6mgg1nmmCEfQP1zNW4BpqtNGSxatux4
	 ZYzBAZYXpbEjczcmmHamzviavK6GYdZcFPm0USzj5SFB2NvXhYy65G9vBXtJeyH44Q
	 6GEIPb/2+wo5A==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
Subject: Re: (subset) [PATCH 00/14] HID: constify fixed up report
 descriptors
Message-Id: <172554776697.1542192.11812830312216775642.b4-ty@kernel.org>
Date: Thu, 05 Sep 2024 16:49:26 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.1

On Wed, 28 Aug 2024 09:33:19 +0200, Thomas Weißschuh wrote:
> Now that the HID core can handle const report descriptors,
> constify them where possible.
> 
> This is based upon hid/for-6.12/constify-rdesc.
> 
> 

Applied to hid/hid.git (for-6.12/constify-rdesc), thanks!

[01/14] HID: bigbenff: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/00f6f65bd116
[02/14] HID: dr: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/49e00b5ca0bb
[03/14] HID: holtek-kbd: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/3ce7edfa4f09
[04/14] HID: keytouch: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/b299944af770
[05/14] HID: maltron: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/d8b21af66601
[06/14] HID: xiaomi: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/c06df4c57af8
[07/14] HID: vrc2: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/49cf20b878fa
[08/14] HID: viewsonic: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/4f3ff3a275f9
[09/14] HID: steelseries: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/88ae9ffc7c85
[10/14] HID: pxrc: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/4211f9b11216
[11/14] HID: sony: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/d4781a27add1
[12/14] HID: waltop: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/24b3c515c69b
[14/14] HID: uclogic: constify fixed up report descriptor
        https://git.kernel.org/hid/hid/c/03f8dc1d0a38

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


