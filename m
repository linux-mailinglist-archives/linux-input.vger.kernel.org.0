Return-Path: <linux-input+bounces-15344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA6BC9A4F
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 16:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90B33AEB29
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 14:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA602EB5C9;
	Thu,  9 Oct 2025 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHixODJU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1504F1991CA;
	Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021749; cv=none; b=Ch6bQxoqzKcJgYsf3J/O1hwhge5d7vBUJnnSxmokG53/8ermrAnnyNvPlfTAQDJiX/ustMg9pbLRqRaLQWRUgUyQYycClvvmorKAclCdxQFHU71QU7hCyztRUZ4Tbi+s/E3vMtIWXF7NUziqLDeznfFc87D/g9t1zr2CXOHfarA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021749; c=relaxed/simple;
	bh=q+cWlPxPDE8w96Y2CQiXS0aKtBuOa6+DcXpQ8Qum6rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP8seWsBgOMTYQ0nKQe+Pylhz4ZjV/++cgqbdLE6yf5nmcP8JUKD4YMCVzeuz+IEbzd84iNJo0jkfPuF+ptsKM8WKr26RXOyQJRXCax3tO6gs48/Yv/T58U11XjR5UqobDIbCelC2BdDB4zxCWSDYXdTyRZ3MfX+Cym552jSDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHixODJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A351C4CEE7;
	Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760021747;
	bh=q+cWlPxPDE8w96Y2CQiXS0aKtBuOa6+DcXpQ8Qum6rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHixODJUsitR6IpUo6GQStTTREA5/WabWR38jQveeKcOr4kdofCnwy6bKURsTK1ic
	 29NprL8jWIyQCVC5QVKwv+t+PVQ0FJkVEZ9bLt1j+JbRCXw+RH6ktrKFTh2ISEgNBE
	 keAx/jIskZ6EuBNnVOOF8RMfX5u+RRm1vRMAm8QXPnCM9te/5VxfYLb0YacvR1WmWT
	 JI4VTznSI3F9mLzlRtvC0NTObI4mfovm/g9+GR2tke3FHvgwPJ+XrZSe6CGkqZgTMV
	 21Rn2gZMNwnb/4P2KXKpEwNZzUeNjT6KhbZZs38aGfbxSK6M81U6HnzSWzmmCYAKTl
	 Dt33KSJzLA0Ww==
Date: Thu, 9 Oct 2025 09:55:46 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Casey Connolly <casey.connolly@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 0/7] Input: synaptics-rmi4 - add quirks for
 third party touchscreen controllers
Message-ID: <20251009145546.GA2124773-robh@kernel.org>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
 <aggtzmlxvj4so6t7trlo5ianjcbq2jrsodv6hlkhtrvgl2qpqj@gflvqocxjckb>
 <b223a48e-952c-4825-bf82-e8922434e3c1@ixit.cz>
 <5gcq5xsurdp24o7wndo2fm7pjsc3khco52ji34jjmeet2nidl4@rkbh4a2c4d3q>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5gcq5xsurdp24o7wndo2fm7pjsc3khco52ji34jjmeet2nidl4@rkbh4a2c4d3q>

On Sun, Sep 21, 2025 at 11:30:22PM -0700, Dmitry Torokhov wrote:
> Hi David,
> 
> On Tue, Sep 16, 2025 at 11:29:45AM +0200, David Heidelberg wrote:
> > On 07/08/2025 06:29, Dmitry Torokhov wrote:
> > > Hi David,
> > > 
> > > On Thu, Jul 31, 2025 at 11:06:50PM +0200, David Heidelberg via B4 Relay wrote:
> > > > With the growing popularity of running upstream Linux on mobile devices,
> > > > we're beginning to run into more and more edgecases. The OnePlus 6 is a
> > > > fairly well supported 2018 era smartphone, selling over a million units
> > > > in it's first 22 days. With this level of popularity, it's almost
> > > > inevitable that we get third party replacement displays, and as a
> > > > result, replacement touchscreen controllers.
> > > > 
> > > > The OnePlus 6 shipped with an extremely usecase specific touchscreen
> > > > driver, it implemented only the bare minimum parts of the highly generic
> > > > rmi4 protocol, instead hardcoding most of the register addresses.
> > > > 
> > > > As a result, the third party touchscreen controllers that are often
> > > > found in replacement screens, implement only the registers that the
> > > > downstream driver reads from. They additionally have other restrictions
> > > > such as heavy penalties on unaligned reads.
> > > > 
> > > > This series attempts to implement the necessary workaround to support
> > > > some of these chips with the rmi4 driver. Although it's worth noting
> > > > that at the time of writing there are other unofficial controllers in
> > > > the wild that don't work even with these patches.
> > > > 
> > > > We have been shipping these patches in postmarketOS for the last several
> > > > years, and they are known to not cause any regressions on the OnePlus
> > > > 6/6T (with the official Synaptics controller), however I don't own any
> > > > other rmi4 hardware to further validate this.
> > > 
> > > Sorry for not handling the patches in the last few submissions. I am
> > > planning on addressing them once merge window opens.
> > 
> > Hello Dmitry, kind reminder about the patch series as the window is open.
> 
> I was looking at the patch series again and with the exception of patch
> #5 they make little sense for sensors other than ones used in OnePlus 6.
> 
> I wonder if we could key it off of something, maybe a distinct
> compatible or a property? Rob, Krzysztof, any suggestions on how to deal
> with devices that do not properly implement the protocol for which they
> claim compatible?

A compatible is "the way" as David has done. Once again, generic 
compatibles have proven inadequate.

Rob

