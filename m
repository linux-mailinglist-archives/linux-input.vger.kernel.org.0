Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D9531E0D9
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 21:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhBQUxl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 15:53:41 -0500
Received: from chill.innovation.ch ([216.218.245.220]:46188 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbhBQUxj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 15:53:39 -0500
Date:   Wed, 17 Feb 2021 12:52:57 -0800
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 6AB8D6413BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1613595177;
        bh=9hWwSvImwpCddJlz6sxGENyLsZ5DxkEBmFxdADy8W0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OGm8UHNhmxezVl+mdk1IfFhbUpmFzR0PRxDo3MjSVfsmo4Yw6pRsDOT3AJuqX9wQP
         ICTbAC7GsLGQ4nU2XP4R8mLomz0FDZVng8Isbk8nmnGrO6uqa3noY1PHAuJ6XL+Lo1
         llJcHNl2TCpcsLJUJ++6+wbl8P1mM92IkXD7KSFFMB3kkjEPGlXaGCkJf0IWoEob5s
         Xk5tBDinYPFEazrZuu1kj7daa0szyp5gwHDFtd8CphmQYQvw8hj1Uvd/djAqw2vPAh
         LaUnFEzAxqp6L+puFRVi+OSRHJS9gukxOhJN26Ikjn5yP9Wym6fBIbUCsiP8+BhcSq
         3kA6AXG6O62cQ==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: applespi: Add trace_event module param for
 early tracing.
Message-ID: <20210217205257.GB25685@innovation.ch>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <20210217190718.11035-3-ronald@innovation.ch>
 <YC176rlGQeyKuOpn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YC176rlGQeyKuOpn@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


  Hi Dmitry,

On Wed, Feb 17, 2021 at 12:26:18PM -0800, Dmitry Torokhov wrote:
> 
> On Wed, Feb 17, 2021 at 11:07:18AM -0800, Ronald Tschalär wrote:
> > The problem is that tracing can't be set via sysfs until the module is
> > loaded, at which point the keyboard and trackpad initialization commands
> > have already been run and hence tracing can't be used to debug problems
> > here.
> > 
> > Adding this param allows tracing to be enabled for messages sent and
> > received during module probing. It takes comma-separated list of events,
> > e.g.
> > 
> >   trace_event=applespi_tp_ini_cmd,applespi_bad_crc
> 
> You can unbind and rebind a device to a driver via sysfs as many times
> as needed (see bind and unbind driver sysfs attributes), so I believe

Hmm, I'm going to have to play with that a bit, but one place it still
won't help I think is something we ran into in practise: init was
failing during boot, but was successfull later on.


  Cheers,

  Ronald

