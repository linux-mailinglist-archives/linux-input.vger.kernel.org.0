Return-Path: <linux-input+bounces-7281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8099952A
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48AA91C2349C
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 22:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6651C172A;
	Thu, 10 Oct 2024 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="eZAuOFUz"
X-Original-To: linux-input@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC431F4736;
	Thu, 10 Oct 2024 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598968; cv=none; b=DeoXk4V2GcMDenDL2TyQcVRKGmRk7uqKls5WHvqUxPAJY9FCg8h6ACNJWWA2OLvhVep89pXKPHtXCy1C6VN7OWR0L2ul3g00c9zGmwDGzVRe4Ozm5H4GSDnElD0KMeFj3dm5OrWcBjZWYi0kC4Sa19VqtnMv6vCRMuhTYSp9Qt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598968; c=relaxed/simple;
	bh=qMev99FX4QS32+0we623c+m4WfmJ9+2tBEGQT+UPLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxX/EBeScZriDWLlGpHzbNt195qMjkHJ+YAwNNJhd0KlgpLTjK0yRhe6mjqQ/cMZx/nUawEcZXjSjXWYI8v6LnRikainKlswPbwHkRkQVPzNJwEfDUsvPdskz7fBrRZX/Wl9lRkL27r0M6v4lA96s8+cfXxul7KcwPrhueIdv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=eZAuOFUz; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jc2QOJPkdZCJraOkoPBPf89c4KRNcnmBfkI3+FCrPfc=; b=eZAuOFUzBo+b4OH71XOjsk4tC1
	Gq2XZcNeneSKhMmHc4Csnw12LM4rh6jTjLqSIHS94W7GFEEVmUj4IqmpLPrrcJnRmHY2KTAPdk2Pu
	cmFUwiaQRmtnYE2GUJ0xckHBFKSkZEvaDrOisq44VDhKv9EVUXDFXXg8RHlTkGHhPoaTcxDIpsm14
	J8z3uBuv+7E4+EBvv1txiM8SKyq2PKCczJ4PNTPbty75XNgI2UrbboqYlYbjFInwlCqxdpvmnDPLw
	AZX5m2HjFxDlr2Eo7YnQIad9fK8p4HUdlO1poQp0g2KTdXHCrG7MsL6c/2Ig0cPLVJDL4ESdc/x/m
	DKfa64Xg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1YO-00000002Yin-2OPG;
	Thu, 10 Oct 2024 22:22:40 +0000
Date: Thu, 10 Oct 2024 23:22:40 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <20241010222240.GE4017910@ZenIV>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
 <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Oct 11, 2024 at 12:09:01AM +0200, Javier Carrasco wrote:

> I think that the issue you are talking about is that the goto will
> trigger the cleanup function of the device_node, which will not be
> initialized at that point.

... and gcc will compile that without an error.  Clang will not, but
you need to watch out for build coverage in arch-specific code -
clang doesn't cover every architecture (and won't cover some of them,
no matter what - alpha, for example).

As for the scope changes... note that you've delayed the moment of
of_node_put() in some of those.  It's harmless for device_node, but
try something of that sort with e.g.

	mutex_lock(&lock);
	something();
	mutex_unlock(&lock);
	foo();
	return 0;

where foo() itself grabs the same lock and it's not harmless at all -

	guard(mutex)(&lock);
	something();
	foo();
	return 0;

is equivalent to moving mutex_unlock() to the end of scope, i.e. past
the call of foo(), resulting in

	mutex_lock(&lock);
	something();
	foo();			// deadlock
	mutex_unlock(&lock);
	return 0;

__cleanup *is* a useful tool, when used carefully, but you really
have to watch out for crap of that sort.

