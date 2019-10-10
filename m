Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7A73D3349
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 23:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfJJVUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 17:20:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:40349 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725867AbfJJVUc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 17:20:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E54F77A4
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2019 17:20:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 10 Oct 2019 17:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=w6wG+s5GQv3v8C8pBktPGkvKoFJ
        4ozqBtO3ILdsDBQ8=; b=rZ1DMalXlkCHGDB3/ub7r89dd55ghJ/Q9l1tHXplAsQ
        KUibvZRIBSo+2b8ijRd0eWHzt6sD0QtA5UOwigbbiuXkURB5/CcJenRg8Hyh5ZmX
        hcaGcSHw2V/FLSQ6nrYDK0iHt/Ws9ft0nyhbVmKbvDxP18qN+lZFqMWq6Hnh9jJj
        vj+px+o6rxeUko+2HN6b/ZJPvbQJRuiAegVjHhwzFkARvumxy93Vx5bhyktMOByW
        PO17k/zH26sVDW3oPn0HSOPaew3Z6CV3Nu06z68f3XwNzR+BW/wtiXVUkvmd+fu6
        VKeiC2ZSk6Ao6/at2A04gYfZsTK258Ve/E5yD1k2egg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w6wG+s
        5GQv3v8C8pBktPGkvKoFJ4ozqBtO3ILdsDBQ8=; b=uAjvKY1E1/w10WBp8Jv4J3
        Ux1iaFFLCe1HIfXgtB5Y0WnpINbtr2VhyW07Qd0FqxFiZEv0Y2ZYUdI3GCMOPhqj
        pYqhMi14P1tpy/ldRyYVXLX93EbcxgbTMhDmAesVrVcoekHo9SAJtIQwG75H6LJr
        Rd3ncCYfrXFn+qz2VP67UZ6VVWdyETfA0Ra6KPOZLrQUdW9CCI8QepqjVg2YydZu
        NC9Fr3uAqK78OaP60tfNKkhoyr/RHgb9luECmIkcPKaoz1buZ+ndYA9cS2f6DkXu
        pkTWoSE49hPwROO1E5dLiur06AK/mvZ/UhKJNRMBbd8ViT86JaZZmjPVBaG7Zsvw
        ==
X-ME-Sender: <xms:n6CfXVsy1KINklSGxruzOjGyYk8EOyJE5UHyzjOBlZ0rDVi2rh_E6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieefgdduieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
    ertddtredvnecuhfhrohhmpefurghmuceurgiilhgvhicuoehsrghmsggriihlvgihsehf
    rghsthhmrghilhdrtghomheqnecukfhppeekiedrvdeirddvvdegrdduheefnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsrghmsggriihlvgihsehfrghsthhmrghilhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:n6CfXVp4VhLW4RcNi9c9n5Y7nUfEUaTQ0KmRhUmRSrwOXwgKsdGuRA>
    <xmx:n6CfXdIQSSY6E4wPs7Edao2WntzRrRNkBEI7jqT-0FD7ELiGo9_hMA>
    <xmx:n6CfXU4_U6rm9o_E61z1xodZot9veIJuiRPHD2G4eGHtgLWEDVJi4Q>
    <xmx:n6CfXQCLLN9d1J7bHMCEbip-bUGdbD4l9Ddzpzdo3GwQb1ZBGopVZg>
Received: from localhost (cpc88620-newt36-2-0-cust152.19-3.cable.virginm.net [86.26.224.153])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1C07A8005A
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2019 17:20:31 -0400 (EDT)
Date:   Thu, 10 Oct 2019 22:20:29 +0100
From:   Sam Bazley <sambazley@fastmail.com>
To:     linux-input@vger.kernel.org
Subject: Re: [PATCH 0/3] Logitech G920 fixes
Message-ID: <20191010212029.kg5tvx4r5cmgshyo@SamLinux>
References: <20191007051240.4410-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007051240.4410-1-andrew.smirnov@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 06, 2019 at 10:12:37PM -0700, Andrey Smirnov wrote:
> Everyone:
> 
> This series contains patches to fix a couple of regressions in G920
> wheel support by hid-logitech-hidpp driver. Without the patches the
> wheel remains stuck in autocentering mode ("resisting" any attempt to
> trun) as well as missing support for any FF action.
> 
> Thanks,
> Andrey Smirnov
> 
> Andrey Smirnov (3):
>   HID: logitech-hidpp: use devres to manage FF private data
>   HID: logitech-hidpp: split g920_get_config()
>   HID: logitech-hidpp: add G920 device validation quirk
> 
>  drivers/hid/hid-logitech-hidpp.c | 193 +++++++++++++++++++------------
>  1 file changed, 120 insertions(+), 73 deletions(-)
> 
> -- 
> 2.21.0
> 

Tested-by: Sam Bazley <sambazley@fastmail.com>

Thanks again Andrey!
