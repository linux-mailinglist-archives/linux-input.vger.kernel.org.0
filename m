Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8072A2FACC4
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 22:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389487AbhARVfc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 16:35:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:39400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389442AbhARKDc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 05:03:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64EA221FF;
        Mon, 18 Jan 2021 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610964160;
        bh=lKbRkVLl0TvJXkgmMwDlKtpVfY+ThcC89YEz8gZ02EQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=l1lR1HZLrBeCwvgvgWQNUduCUQIJLeM2ttXJ6Kc3HOYwciiNY94SJkKZDIrJ6uFP8
         DFWkoZ8iLcEMLMSCKz5Bz1HHoR+cTC6AfLlvYjNHbeqrcGBK2Ef+hp2MQsmDMvO5vs
         R7LU00JFedM8GKjO3YhTvwQukwLfkt3SCZxPBHZY79VsdtePMrxTjUqTDFiDW9zap7
         apebJLctG2glWzt8njpajvPz/MgoF1W49iwLdmTer7VRSIT0WK+uHeO3twRM9UU/R5
         E3hulgHkLM1joW/rVePfHGYIOXy9V9Bt3J6B94oPULC0KCExQVrhuuIrkonJwFa/fe
         oANZQzQQI2unA==
Date:   Mon, 18 Jan 2021 11:02:37 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
In-Reply-To: <d65b0829d31ed6eb15f69b8771718d38a56a2502.camel@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2101181100040.5622@cbobk.fhfr.pm>
References: <20210104182937.1472673-1-lains@archlinux.org>   <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm>  <e832278f9021c0f71afc5f90261bd17aea45a336.camel@archlinux.org>  <nycvar.YFH.7.76.2101081554190.13752@cbobk.fhfr.pm>
 <d65b0829d31ed6eb15f69b8771718d38a56a2502.camel@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Jan 2021, Filipe Laíns wrote:

> Yeah :head_scratch:
> There is a header comment at the start of each feature section, which I think
> does a good job pointing this out. IMO the problem with the naming is more for
> people who see its usage in other parts of the code, but I guess that is C for
> you right? Names don't scale well with code quantity :P

Alright ... thug life :) Let's just keep it the way it is.

> > > > Could you please use standard kernel commenting style here?
> > > 
> > > Oops, sorry. Will do :)

I have adjusted the wrong comment and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

