Return-Path: <linux-input+bounces-10068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CBA36C89
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 08:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28DDF7A2C32
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 07:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C44199FB2;
	Sat, 15 Feb 2025 07:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O7UlnbKr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5718B484;
	Sat, 15 Feb 2025 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739605937; cv=none; b=A4tpJeqgJLql4vLTaI3nEgPDKfxt1eeil37aF0EM3X1rd9yYpr2aA72OT041TOHLxN4CNAw/3Kzgi+jwCTsa6UOPA5FzSoj0BuK0zmd4Kby3NajEbOPP4t4ZaaLOp03JH9UadtePwhpFYkITXDeZGlpHhPK+s6OUQ2dGdHzODGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739605937; c=relaxed/simple;
	bh=iEO4fZVVqTnk+DHtCerwPLANOhBbouzKPWaUP8b/LgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbiqVp9kvnpnLE3o2EeLJjpnONWtPTdTnX0v9gViadnqN6yL6BAmo9xZSJrZXnUDhc/yB8kdHLJhUCQ0vOGR94pxOmGMwxF+KMC88JfdHVJgGZ2nscVY5KZcMG3kkLzRJDNhohP9JLF8XCWQ4udr2MRMAc8/AStbGANC+Za02Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O7UlnbKr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EF4C4CEDF;
	Sat, 15 Feb 2025 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739605936;
	bh=iEO4fZVVqTnk+DHtCerwPLANOhBbouzKPWaUP8b/LgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7UlnbKrM3z04uhmrFgA8uEAq5rEViUUqd0AYd13/LDeu31ccU+fw4BUo6lqSaurF
	 VRbdHPy/7IBAiQagjEurhJKemUnOaajIAgoRZf1Bs1fgjnBLlanW4N9+THzs/DONUT
	 q2kKNkIf1yvRcl8gJNdWYeHE0MZfFLaBZPfVg6So=
Date: Sat, 15 Feb 2025 08:52:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v34 00/31] Introduce QC USB SND audio offloading support
Message-ID: <2025021500-clang-suspect-0cb3@gregkh>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
 <3b9447e2-4be8-479b-a418-5fd45369fb55@quicinc.com>
 <2025021413-favorable-manatee-6859@gregkh>
 <f5dfc875-d5bd-49d7-b998-6d25f59e849a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5dfc875-d5bd-49d7-b998-6d25f59e849a@quicinc.com>

On Fri, Feb 14, 2025 at 07:07:15PM -0800, Wesley Cheng wrote:
> Hi Greg,
> 
> On 2/14/2025 12:33 AM, Greg KH wrote:
> > On Tue, Feb 11, 2025 at 12:35:23PM -0800, Wesley Cheng wrote:
> >> Hi,
> >>
> >> On 1/21/2025 1:04 PM, Wesley Cheng wrote:
> >>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> >>>
> >>
> >> Just seeing if we have any further feedback on this series? Thanks.
> > 
> > Given the lack of responses, and the huge number of iterations of this,
> > I've applied it now to my usb-testing branch to give 0-day some better
> > runs at it.  If it passes that in a few days, I'll move it to my
> > usb-next branch for inclusion into linux-next and hopefully 6.15-rc1.
> > 
> > thanks for sticking with this!
> > 
> 
> I saw that kernel test bot reported some sparse errors.  I had some issue with my config and looks like sparse wasn't actually scanning the files I added.  Will fix that and resubmit another rev that addresses any errors.  Apologies for not catching this beforehand.

Not a problem, I've dropped them all from my tree now.

thanks,

greg k-h

