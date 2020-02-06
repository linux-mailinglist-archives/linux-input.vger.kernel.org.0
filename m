Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A2D15413A
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 10:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgBFJeI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 04:34:08 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60495 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgBFJeI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 04:34:08 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 98551C0011;
        Thu,  6 Feb 2020 09:34:02 +0000 (UTC)
Message-ID: <7234b9c22612f43c9458e84f74faf32f658b0015.camel@hadess.net>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Conn O'Griofa <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Date:   Thu, 06 Feb 2020 10:34:02 +0100
In-Reply-To: <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
References: <20200126194513.6359-1-martyn@welchs.me.uk>
         <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
         <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
         <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
         <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm>
         <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
         <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm>
         <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-02-06 at 09:09 +0100, Benjamin Tissoires wrote:
> 
<snip>
> If this is something Roderick would be interested in, we can then try
> to extend this initial work on Bluetooth controllers and the
> DualShock
> ones.
> Adding the clones ones based on the current kernel code is something
> doable, but I do not expect Sony to be involved in that process.

Sony didn't provide any of the code that allows us to support those
devices over Bluetooth, and support isn't complete either.

I'd certainly appreciate getting information about how to pair those
devices (if there's anything on top of the code already implemented),
how to pair the PS3 headset and keyboard accessories (which are still
unsupported), and how to access the headset pairing for the PS4
controllers.

