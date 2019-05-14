Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092EC1CCFD
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 18:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfENQau (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 May 2019 12:30:50 -0400
Received: from bmailout2.hostsharing.net ([83.223.90.240]:37569 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfENQau (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 May 2019 12:30:50 -0400
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 153672800B3E6;
        Tue, 14 May 2019 18:30:48 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id B203A436D43; Tue, 14 May 2019 18:30:47 +0200 (CEST)
Date:   Tue, 14 May 2019 18:30:47 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [git pull] Input updates for v5.2-rc0
Message-ID: <20190514163047.xurqbqbnrme5r4hq@wunner.de>
References: <20190513201235.GA87488@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513201235.GA87488@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 13, 2019 at 01:12:35PM -0700, Dmitry Torokhov wrote:
> Please pull from:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
> 
> to receive updates for the input subsystem. You will get a few new
> drivers:
> 
> - driver for Azoteq IQS550/572/525 touch controllers
> - driver for Microchip AT42QT1050 keys
> - driver for GPIO controllable vibrators
> - support for GT5663 in Goodix driver

This is missing the driver to support the keyboard and trackpad
on 2015+ MacBooks and MacBook Pros / Airs.  Those machines make up
a large segment of the laptop market and are pretty much unusable
on Linux without the driver:

https://www.spinics.net/lists/dri-devel/msg207174.html

The patches have gone through 7 iterations, have been reviewed
extensively, all review comments were addressed properly and
the code is now in excellent shape.  The last iteration was
posted to the list 1 month ago, well in time to make it into
this merge window.  So I don't understand why it's not part
of this pull request.

Please consider submitting a second pull request for the ongoing
merge window with that driver.

Thanks,

Lukas
