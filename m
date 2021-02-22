Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBC13212D1
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 10:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhBVJKu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 04:10:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:44698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230100AbhBVJK2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 04:10:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2E0664DE5;
        Mon, 22 Feb 2021 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613984987;
        bh=EKegPUwUKotxlOegY+ew4LCdfwE80de2IMwqvvfAsRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZtlI7RfJd7K8Pl+3BbAZ62wLQpyFOJfsBNT1issztP86fCbNFksE1aUfo1bG3EYBO
         EX5ugvyjRIH/nZLqMTr80NmLvaEVghZdRiYMVqtZbk9BNIiO8ks4EZDLIpELkegooR
         dJvWgvDftHSugjtrTF1qzG8H/N0LBu9CFub7dY3zAoXrSA/5mgwlvdZm3NBjxQEnOR
         sjnE+QctDeC34/SspuRRmZvxjwKr3iy8TrmSjfldyAPgoIPDOiN2iTrxQnGgFsha5f
         6fIQlY+zVeIAmtYpIB6FxhbzohElwHvM+9dszyA5tf8R/uJbRvZMpqKTCqjADsChHe
         oIDIOuqEwsRpw==
Received: by pali.im (Postfix)
        id 12BE8C9A; Mon, 22 Feb 2021 10:09:44 +0100 (CET)
Date:   Mon, 22 Feb 2021 10:09:44 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        colin.king@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: input: mouse: Change postive to positive in the
 file alps.c
Message-ID: <20210222090944.nhvcwmzkwuoh2g4z@pali>
References: <20210222075439.32201-1-unixbhaskar@gmail.com>
 <97932a41-0d3b-adaa-3b08-35c6e81763ff@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97932a41-0d3b-adaa-3b08-35c6e81763ff@infradead.org>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Monday 22 February 2021 00:07:40 Randy Dunlap wrote:
> On 2/21/21 11:54 PM, Bhaskar Chowdhury wrote:
> > 
> > s/postive/positive/
> > 
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Pali Rohár <pali@kernel.org>

> > ---
> >  drivers/input/mouse/alps.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > index b067bfd2699c..4a6b33bbe7ea 100644
> > --- a/drivers/input/mouse/alps.c
> > +++ b/drivers/input/mouse/alps.c
> > @@ -986,7 +986,7 @@ static void alps_get_finger_coordinate_v7(struct input_mt_pos *mt,
> >  	case V7_PACKET_ID_TWO:
> >  		mt[1].x &= ~0x000F;
> >  		mt[1].y |= 0x000F;
> > -		/* Detect false-postive touches where x & y report max value */
> > +		/* Detect false-positive touches where x & y report max value */
> >  		if (mt[1].y == 0x7ff && mt[1].x == 0xff0) {
> >  			mt[1].x = 0;
> >  			/* y gets set to 0 at the end of this function */
> > --
> 
> 
> -- 
> ~Randy
> 
