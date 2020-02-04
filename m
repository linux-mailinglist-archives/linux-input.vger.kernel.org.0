Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D101517BB
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 10:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgBDJXa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 04:23:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:52742 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgBDJXa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 04:23:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BA069AC9A;
        Tue,  4 Feb 2020 09:23:28 +0000 (UTC)
Message-ID: <1580807154.11089.0.camel@suse.com>
Subject: Re: USB HID fix: Retry sending timedout device commands 20 times
From:   Oliver Neukum <oneukum@suse.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Date:   Tue, 04 Feb 2020 10:05:54 +0100
In-Reply-To: <CAO-hwJJDkFh+ZS7pCZLhfuoXeAByFLzKbPW8mHtF=N_e-hn+Dg@mail.gmail.com>
References: <9cf20b6f-5bfa-2346-ca9f-5ca81245bfff@pp.inet.fi>
         <CAO-hwJJDkFh+ZS7pCZLhfuoXeAByFLzKbPW8mHtF=N_e-hn+Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Dienstag, den 04.02.2020, 09:17 +0100 schrieb Benjamin Tissoires:
> Ouch, very much ouch. Resending 20 times on a generic path when the
> timeout can be several seconds is pretty much a bad thing. Again, this
> should be limited to the device you are talking to, and not be
> generic. Or maybe you are encountering a usb controller issue.

Yes. You need a least to consider teh unplug case.

	Regards
		Oliver

