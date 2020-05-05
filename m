Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254491C5FE8
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 20:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730582AbgEESTV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 14:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730258AbgEESTV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 14:19:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2240720663;
        Tue,  5 May 2020 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588702760;
        bh=8YWntH0BcwMssZMsDbibLAY9kGQBxOejyy5ySOH65mg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1MWWLLYgTT0zVQRgJ/snQ/KkboALVnB2QENjatYA7hIAeAhUiadvtofb5HVTmgHxX
         WKzgtZs/pF0DRjldMkFBYrHwV/UeDfEnZ9FBnk/pDsulDARgtIxJ77WOVwpLd72q6R
         MlOjxqyJdEkYuyd7Ye4KSmK2llRpLoSK37DJv4bM=
Date:   Tue, 5 May 2020 20:19:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06: Use DEFINE_DEBUGFS_ATTRIBUTE to
 define debugfs fops
Message-ID: <20200505181918.GA1216826@kroah.com>
References: <20200505153325.20113-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505153325.20113-1-aishwaryarj100@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 05, 2020 at 09:03:24PM +0530, Aishwarya Ramakrishnan wrote:
> It is more clear to use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs file
> operation rather than DEFINE_SIMPLE_ATTRIBUTE.

No it is not, why do you think so?

The two defines do different things, that is why we have 2 different
defines.  You can not just replace one with the other without
understanding why one was used and not the other one.

Did you test this change to verify that everything still works
properly?  Why is it needed to be changed at all?

thanks,

greg k-h
