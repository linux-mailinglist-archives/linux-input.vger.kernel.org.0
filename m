Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE56433205
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhJSJTx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:19:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:60704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234519AbhJSJTx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:19:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE6B86115A;
        Tue, 19 Oct 2021 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634635060;
        bh=9+ooGHjkwtByMB5Ja9m1czBL6YEiNK/4UYkm9XccbCg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ud50Yy8Zy/2WW9+vZ6arLcvnnCfO8iQ6LkgxfBgsBSSe86J/SYkeFPOeWPpK0wvoY
         4HvHzASNkLxoTVXtGixFYNXOHAGDfEUPW7EQpWgs6vIRHR7M5sY81AiooBv4BQkdvS
         nt/6/BOoJYDTvpCt4PiVG4ZLIqRxMi13dMChGmdOt/XcJpND3au2hqumIMlcZUj3tv
         JxEjd8s9fdR+7Hja8LDl4y5zZaiR+jsevGWguLs4IGvqjEZTHqVeVCHxzMF+boJ6Yk
         voDL7HhxuYSb3xI/o8KykaF3m9s8RSWQdtzZog31Rt9pNdcwDyelVp8dhi8yrOkWFH
         A2lnTkJUe8xdA==
Date:   Tue, 19 Oct 2021 11:17:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Vin=EDcius_Angiolucci_Reis?= 
        <itsme.vreis@gmail.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        angiolucci@gmail.com
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to
 KEY_SCREENLOCK
In-Reply-To: <20211008222327.9324-1-angiolucci@gmail.com>
Message-ID: <nycvar.YFH.7.76.2110191117280.12554@cbobk.fhfr.pm>
References: <20211008222327.9324-1-angiolucci@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Oct 2021, Vinícius Angiolucci Reis wrote:

> On Windows systems, ASUS laptops uses the "turn display off" key
> (usually fn+f6) to turn both display and keyboard backlit off. On Linux
> systems, this key has no effect at all since most desktop enviroments
> don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
> instead, would enable desktop environments to handle this key as a
> screen lock intent from the user, out of the box.
> 
> Signed-off-by: Vinícius Angiolucci Reis <angiolucci@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

