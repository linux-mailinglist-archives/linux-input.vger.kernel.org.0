Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB265B8E0
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 12:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfGAKUa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 06:20:30 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:51773 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGAKUa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 06:20:30 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3417F240016;
        Mon,  1 Jul 2019 10:20:28 +0000 (UTC)
Message-ID: <add17925a930d995ef5e395c0b716e7b7638acba.camel@hadess.net>
Subject: Re: [PATCH v4] HID: sb0540: add support for Creative SB0540 IR
 receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <bnocera@redhat.com>
Date:   Mon, 01 Jul 2019 12:20:27 +0200
In-Reply-To: <CAO-hwJJaj6f216_H=UFO0CEp+ZHRWwvhTO9FCPqdeimEwE6p0Q@mail.gmail.com>
References: <20190701100819.6032-1-hadess@hadess.net>
         <CAO-hwJJaj6f216_H=UFO0CEp+ZHRWwvhTO9FCPqdeimEwE6p0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-07-01 at 12:15 +0200, Benjamin Tissoires wrote:
> 
<snip>
> I forgot to mention that sparse was complaining about:
> 
> scripts/Makefile.build:283: target 'drivers/hid/hid-creative-
> sb0540.c'
> doesn't match the target pattern
> 
> And it turns out your line should read `hid-creative-sb0540.o` not
> `hid-creative-sb0540.c`

It does show that I didn't fancy making my office warmer with a full
kernel compile, right?

v5 sent with the fix, thanks.

