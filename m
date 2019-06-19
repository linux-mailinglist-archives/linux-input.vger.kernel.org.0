Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B556E4C3FD
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 01:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbfFSXNW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 19:13:22 -0400
Received: from vie01a-dmta-pe05-1.mx.upcmail.net ([84.116.36.11]:42586 "EHLO
        vie01a-dmta-pe05-1.mx.upcmail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbfFSXNW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 19:13:22 -0400
Received: from [172.31.216.234] (helo=vie01a-pemc-psmtp-pe11.mail.upcmail.net)
        by vie01a-dmta-pe05.mx.upcmail.net with esmtp (Exim 4.92)
        (envelope-from <jiridvorak@centrum.cz>)
        id 1hdjlX-0000HT-Kd
        for linux-input@vger.kernel.org; Thu, 20 Jun 2019 01:13:19 +0200
Received: from localhost ([94.113.181.121])
        by vie01a-pemc-psmtp-pe11.mail.upcmail.net with ESMTP
        id djlXhBKRuEZz0djlXhPnV4; Thu, 20 Jun 2019 01:13:19 +0200
X-Env-Mailfrom: jiridvorak@centrum.cz
X-Env-Rcptto: linux-input@vger.kernel.org
X-SourceIP: 94.113.181.121
X-CNFS-Analysis: v=2.3 cv=E8KzWpVl c=1 sm=1 tr=0
 a=s7YJerHMVUoi9pLLx4laNg==:117 a=s7YJerHMVUoi9pLLx4laNg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pwKtuhUnKVnDPx35zBQA:9
 a=CjuIK1q_8ugA:10
Date:   Thu, 20 Jun 2019 01:13:18 +0200
From:   Jiri Dvorak <jiridvorak@centrum.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Anssi Hannula <anssi.hannula@bitwise.fi>,
        linux-input@vger.kernel.org
Subject: Re: PROBLEM: Race between upload and playback in ff-memless
Message-ID: <20190620011318.474e6773@centrum.cz>
In-Reply-To: <20190619005234.GE62571@dtor-ws>
References: <20190617224831.7aa9ac53@centrum.cz>
        <20190619005234.GE62571@dtor-ws>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEUtLpze/l0C/d+UqpiD6Qrm90yQVasz6cfNK9Hr4sg1aeT9PsWRyTzwlzqdKoHsJ0J+JN5JTwoj1a6RLpWY0x5OrlLZJzN5/HMH9n1NRN45gyX85zRt
 BGNHnLihGlWNFOhjoX10WLt5OFDqpysg5v7aQvyKWEvmHlSq5QNNwBETUM2M4H8GF9uMK8Y+BTFa1a0kmEhXxnWdOkjmu0dWcFVtkp7lOiVWZuaKBxTgy0/h
 PlKqNoMlqSbuqbWlAMRprw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

> I wonder if we can't simply leave the FF_EFFECT_PLAYING flag as is
> when updating an effect. Although we still may skip over them in
> ml_get_combo_effect() is play_at is in the future. Should we
> immediately stop updated effects?

You can not stop the effect for update with zero delay. This would create on->off->on pulse in the force during each update for applications which are using a single continuously updated force. Be it rumble for applications ported from xinput style api or constant for some racing simulations.

Stopping effect for update with non-zero delay would actually improve consistency. Currently the behavior in this case depends on if there is another force of the same type currently playing. If there is none, hw force is not updated and remains at its last state until the new play_at time. If there is second effect which will trigger hw update then the first effect effectively stops when that happens. The downside of change in this behavior after such long time is that there might be applications knowingly or unknowingly relying on it.

I think that changing the stop operation to always set FF_EFFECT_ABORTING flag together with setting play_at to jiffies (to bypass the check in ml_get_combo_effect) regardless of the playing state of started effect might fix the original issue.

Improving the consistency in the non-zero delay case would likely require a different flag which would cause the timer to be scheduled for now, bypass the play_at check and not mix the force in if the play_at check would otherwise fail.

With regards
Jiri
