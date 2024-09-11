Return-Path: <linux-input+bounces-6424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD77974A71
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 08:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A511F258D5
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 06:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D73A4E1C4;
	Wed, 11 Sep 2024 06:30:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766A2C1B4
	for <linux-input@vger.kernel.org>; Wed, 11 Sep 2024 06:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726036219; cv=none; b=eYbWmhwXG4F52TrGN/WbtN6VBli9T4c5lBq1Cou1gzy51f1UU6oaowJgeEnWZhGAOYTKCEqYwZhy5JTtXj5UqKMREIOHlXXn/vJK7UmSPUGzwvcSHSO07tF8Kwv4CV+9ZIms9fcOSpiCJZ4FwjpsgsRmyD7MMdzcoGOZGrbIVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726036219; c=relaxed/simple;
	bh=zZ/ATx+qZFeyGcsQu2Y6xJh76IaUGTTKGCCQD8aDsmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3TiLwZ3S/O9g+LUPCUKK2iy5k5IVKvzuo4DsTM2k9+7ZqJkfGyDL/iI99ga7EgvhS79g/RJ6nj3/9m6jR01y2+/oOSNlZaf3O7/D0XQAbU+XgckkC9HhLTWRsWIz7UrYxGTAM1WVQobfX7KanBC+HB8/jmMSr9clt41pdTc5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.94.2)
	(envelope-from <laforge@gnumonks.org>)
	id 1soGrh-006aWM-HB; Wed, 11 Sep 2024 08:30:09 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.98)
	(envelope-from <laforge@gnumonks.org>)
	id 1soGkO-00000000fI0-2xJf;
	Wed, 11 Sep 2024 08:22:36 +0200
Date: Wed, 11 Sep 2024 08:22:36 +0200
From: Harald Welte <laforge@gnumonks.org>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-input@vger.kernel.org
Subject: Re: hid-lenovo breaks middle mouse button on tpIIkbd
Message-ID: <ZuE3LCFuiU7spXVv@nataraja>
References: <Ztwoai8_1L0rJkYp@nataraja>
 <8e4a1afd-f82c-4262-b05b-ff5a1c18bee6@valdikss.org.ru>
 <8359e8a4-c8bb-4ff7-aa70-c1e2d19f93c6@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8359e8a4-c8bb-4ff7-aa70-c1e2d19f93c6@valdikss.org.ru>

Hi ValdikSS,

thanks for your follow-up and investigation. Sorry for pointing the finger
in the wrong direction. It's weird to me that the problem can be worked around
reliably by unloading / blacklisting hid-lenovo.  But then, as I said, I have
no real knowledge about either bluetoth or the input layer..

On Wed, Sep 11, 2024 at 02:51:27AM +0300, ValdikSS wrote:
> On 11.09.2024 01:07, ValdikSS wrote:
> > You found a REGRESSION (and not in hid_lenovo)! Look below.
> >
> > [...]
> 
> The regression is caused by bluez:
> https://github.com/bluez/bluez/issues/949

Thanks, let's ee what the bluez maintainers have to say...

-- 
- Harald Welte <laforge@gnumonks.org>          https://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

