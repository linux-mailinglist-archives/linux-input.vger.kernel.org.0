Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E7131078F
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 10:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhBEJRX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 04:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:32870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBEJOi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 04:14:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53C1364F87;
        Fri,  5 Feb 2021 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612516437;
        bh=g7qqE/LjRr2SK/zPFKonfwnMqNYdpQUw1Z/J54Z5cEg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Cm1eri8I9kgCAimFEfhI3wfbH05FN4iadZ2sHQ1rGwU6VqUVSer0mB1oQedn8WPTg
         8wUthbV5RAvIvcQwRNWdEzNYcdH6q5qNy8mdfJPJqVLpw489CD6VsyfPbzTZSGQ/AB
         B3xX21I1+2YtKLvD6e0VHwGT2iJjEY2GehhIIMDjzaBSWSVRMSwBViHjymSNEDVYy7
         q1zssbVFqDVsGgm2rMyEwprgiBTybA2NS7KH6i06c2B/EL0ce55a7A5IncX5JvV9eq
         e7yS9bXFBYHCTD+icXtI6B57E77v9lOh1e/TUq/mx5nG05KOjGwRynaNvTbmQgqfwe
         XhvlRviYFazEg==
Date:   Fri, 5 Feb 2021 10:13:54 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: lg-g15: make a const array static, makes object
 smaller
In-Reply-To: <20210204172748.107406-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.2102051013440.28696@cbobk.fhfr.pm>
References: <20210204172748.107406-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Feb 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array led_names on the stack but instead make
> it static. Makes the object code smaller by 79 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   19686	   7952	    256	  27894	   6cf6	drivers/hid/hid-lg-g15.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   19543	   8016	    256	  27815	   6ca7	drivers/hid/hid-lg-g15.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

-- 
Jiri Kosina
SUSE Labs

