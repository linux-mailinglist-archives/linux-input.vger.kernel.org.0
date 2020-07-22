Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CAA22A044
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 21:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgGVTr1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 15:47:27 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45183 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgGVTr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 15:47:27 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B447220004;
        Wed, 22 Jul 2020 19:47:22 +0000 (UTC)
Message-ID: <08812dc28896e5be07cfc40dda790f0d62171f7b.camel@hadess.net>
Subject: Re: [PATCH v11 00/11] HID: nintendo
From:   Bastien Nocera <hadess@hadess.net>
To:     Daniel Ogorchock <djogorchock@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>
Date:   Wed, 22 Jul 2020 21:47:21 +0200
In-Reply-To: <CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
         <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
         <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
         <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
         <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
         <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
         <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
         <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com>
         <CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-07-22 at 14:22 -0500, Daniel Ogorchock wrote:
> 
> <snip>
> I will probably hold off on submitting that until we
> figure out the right
> solution to the hidraw issue.

Any chance you could make your work available as a stand-alone driver?
Something like this:
https://github.com/hadess/retrode
would make it easy to test in-development versions of the driver until
it lands (I might want to give a try to the optional features for the
GBros adapter as we discussed a couple of months ago).

Cheers

