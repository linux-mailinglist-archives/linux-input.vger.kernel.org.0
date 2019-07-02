Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C965CC20
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 10:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfGBIjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 04:39:42 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56227 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbfGBIjl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 04:39:41 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 75199200009;
        Tue,  2 Jul 2019 08:39:34 +0000 (UTC)
Message-ID: <9171d69f51a6a197e0d554326fcedc39bfb3fbbc.camel@hadess.net>
Subject: Re: [PATCH v5] HID: sb0540: add support for Creative SB0540 IR
 receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <bnocera@redhat.com>
Date:   Tue, 02 Jul 2019 10:39:33 +0200
In-Reply-To: <CAO-hwJ+hHKqZeOfpnWkU57RwzD4m6U9afG7iMND=OGZodzS1GQ@mail.gmail.com>
References: <20190701102010.6611-1-hadess@hadess.net>
         <CAO-hwJ+hHKqZeOfpnWkU57RwzD4m6U9afG7iMND=OGZodzS1GQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2019-07-02 at 10:29 +0200, Benjamin Tissoires wrote:
> drivers/hid/hid-creative-sb0540.c: In function
> 'creative_sb0540_raw_event':
> drivers/hid/hid-creative-sb0540.c:157:3: error: label 'out' used but
> not defined
>   157 |   goto out;
>       |   ^~~~
> 
> It would have been nice to at least try to compile it in a tree.
> You don't need to compile the whole tree: just clone it, apply your
> patch and then `make -j4 M=drivers/hid`

v4 _did_ build. Don't be surprised if after 4 versions on top of the
ones you did when the driver was out of tree, I get review fatigue, go
for expediency and some mistakes slip through.

Fixed in v6.

