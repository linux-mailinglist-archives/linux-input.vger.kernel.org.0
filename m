Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917453A7931
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 10:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhFOImU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 04:42:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230519AbhFOImT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 04:42:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37628613D9;
        Tue, 15 Jun 2021 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623746415;
        bh=vbzQgSVybUVrugIU/hTERs0Txkxt18U6iUh3R1s7r+8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KmlLfM74w4Dyusv6oRlLv1NUVsRkbb4+5OfKO9ZTX6XkuCOpxRCCryvEIBiY+gpZ3
         Po0S0kgWO+YO/5xJ5D4iUPiDprfAkY2PMtrRAxc7brwSQCyI64tH/xozRjeJrWld6i
         pokv95FJjj++NlfE4jw+qShKI2Y7Q9LAd3tatwDyIGvv/01s8y/1rXTPmM6/wWu3bp
         0CfnvgqPelHxdCoaECPhTFiwZcyD2b8csy6uU0xeYEo+Z4Pgyr4oJyrmzW3dxaqown
         8/LX2dd0LmVGeT+eUAIgg2sSfdvmZXiiN+U3j1yuGApAZH0zdlJGh/ptAGf1T3yNPw
         zkuzz+r1VHK3g==
Date:   Tue, 15 Jun 2021 10:40:04 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
cc:     "Singh, Sandeep" <ssingh1@amd.com>,
        Basavaraj Natikar <bnatikar@amd.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        "Singh, Sandeep" <Sandeep.Singh@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH RESEND] amd_sfh: change in maintainer
In-Reply-To: <d817e3c5-0ba9-541f-23c6-c1875d371586@amd.com>
Message-ID: <nycvar.YFH.7.76.2106151039560.18969@cbobk.fhfr.pm>
References: <5f36f1b9-67f8-519d-051b-eb88fcfc2e71@amd.com> <402d47b4-71ba-ee81-2b1b-195b35e0794e@amd.com> <nycvar.YFH.7.76.2106141508520.28378@cbobk.fhfr.pm> <d817e3c5-0ba9-541f-23c6-c1875d371586@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 15 Jun 2021, Shah, Nehal-bakulchandra wrote:

> >>> I would like to take the maintainer-ship of AMD SENSOR FUSION HUB DRIVER
> >>>
> >>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> >>> ---
> >>>   MAINTAINERS | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 04babfa8fc76..1d27060fca21 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -973,7 +973,7 @@ F:  drivers/net/ethernet/amd/xgbe/
> >>>
> >>>   AMD SENSOR FUSION HUB DRIVER
> >>>   M:     Nehal Shah <nehal-bakulchandra.shah@amd.com>
> >>> -M:     Sandeep Singh <sandeep.singh@amd.com>
> >>> +M:     Basavaraj Natikar <basavaraj.natikar@amd.com>
> >>>   L:     linux-input@vger.kernel.org
> >>>   S:     Maintained
> >>>   F:     Documentation/hid/amd-sfh*
> >>> --
> >>> 2.25.1
> >> Acked-by: Sandeep Singh <sandeep.singh@amd.com
> >> <mailto:andy.shevchenko@gmail.com>>
> > This reads strange. I guess Andy's mail should be just removed?
> 
> yes,not sure what was the issue.
> 
> Acked-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>

Thanks, now applied.

-- 
Jiri Kosina
SUSE Labs

