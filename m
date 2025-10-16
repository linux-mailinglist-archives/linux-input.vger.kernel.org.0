Return-Path: <linux-input+bounces-15527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753EBE48F6
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 18:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D948C507566
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 16:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D530E2E54D6;
	Thu, 16 Oct 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcHK45yR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A823EAB5;
	Thu, 16 Oct 2025 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631655; cv=none; b=ZUZ6nmmWMOD2dstT75vsEZfimfwh5oqTxttPW8BUVNAZRqvgNC2OA4Q5jchYQ7SlcFKKrzIVUHQ6XtnG0e3e5TB1JshIHXumjzX8nkmjZAlyypDJxD8DCkesguppGl1C4S14uSU4W12eHDBnbj3lPdVcPCpn5U95cfphvcnVqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631655; c=relaxed/simple;
	bh=BEu9qaRzk35340E/96dwUIzN9WPKSPh9nRuOEb2g2gE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=luCz/ISGp7HQiZkmnbz1+562UECKrrNCcX0I7mE/XtuvhhfYoECPLnohWzNwFJeyr6jvqgntROuwLonBJTL+e5J6c+HklZ+X9isPd6Gef8cQqWMO7lpTgLVLeNZ2RVOMO7K2MPU1qqR89JdX4etZtmO4qn2FHR72HeepNo5/iC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcHK45yR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D068EC4CEF1;
	Thu, 16 Oct 2025 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760631655;
	bh=BEu9qaRzk35340E/96dwUIzN9WPKSPh9nRuOEb2g2gE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lcHK45yRniJFxnBn73icMlpa6vj4BEUpjOB/t68h9di+dUoyq53q3gg2c+Jfn2s4+
	 EUVVzjl/qkNyjJiTsu2/ZSHHAFtKWGI5iZqd4WSY1068hE8guOR2LJbq+ZLAb9lkAa
	 KXYQzcDz2nDxRujGIQKRpiESTuv72dDHNLdA1NREFKrjjAZyUm/v7fYRgrg62/dMnU
	 YwVi0RlnJVDeMf6kOj/WUA8PWJd1GrHlaqmK8w89AaE5MoZcpYQUAFUWHrVnfXA74v
	 VjLesI254N/ygbXuLtDZqJoSXEGJDXk64ykRKQws2sYXBr63SE/KNokPANV3KYzjJJ
	 ZgfWNPba3m/yA==
Date: Thu, 16 Oct 2025 18:20:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Bastien Nocera <hadess@hadess.net>, 
    =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Add
 HIDPP_QUIRK_RESET_HI_RES_SCROLL
In-Reply-To: <20251006010726.189197-2-stuart.a.hayhurst@gmail.com>
Message-ID: <s208042q-64pp-99sp-49qs-10640n7opn0o@xreary.bet>
References: <20251006010726.189197-2-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Oct 2025, Stuart Hayhurst wrote:

> The Logitech G502 Hero Wireless's high resolution scrolling resets after
> being unplugged without notifying the driver, causing extremely slow
> scrolling.
> 
> The only indication of this is a battery update packet, so add a quirk to
> detect when the device is unplugged and re-enable the scrolling.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218037
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> ---
> 
> I assume this affects more than just my mouse, but I don't have the hardware
> to find out which other mice need this too.

We will find out about more devices later for sure.

Thanks, now applied to hid.git#for-6.18/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


