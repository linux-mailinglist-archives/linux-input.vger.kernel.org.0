Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EAF4C454
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 02:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbfFTAIr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 20:08:47 -0400
Received: from vie01a-dmta-pe08-2.mx.upcmail.net ([84.116.36.21]:49997 "EHLO
        vie01a-dmta-pe08-2.mx.upcmail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729971AbfFTAIr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 20:08:47 -0400
Received: from [172.31.216.234] (helo=vie01a-pemc-psmtp-pe11.mail.upcmail.net)
        by vie01a-dmta-pe08.mx.upcmail.net with esmtp (Exim 4.92)
        (envelope-from <jiridvorak@centrum.cz>)
        id 1hdkdA-0009IX-CF
        for linux-input@vger.kernel.org; Thu, 20 Jun 2019 02:08:44 +0200
Received: from localhost ([94.113.181.121])
        by vie01a-pemc-psmtp-pe11.mail.upcmail.net with ESMTP
        id dkdAhCPhBEZz0dkdAhPt18; Thu, 20 Jun 2019 02:08:44 +0200
X-Env-Mailfrom: jiridvorak@centrum.cz
X-Env-Rcptto: linux-input@vger.kernel.org
X-SourceIP: 94.113.181.121
X-CNFS-Analysis: v=2.3 cv=E8KzWpVl c=1 sm=1 tr=0
 a=s7YJerHMVUoi9pLLx4laNg==:117 a=s7YJerHMVUoi9pLLx4laNg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=5Xz7s1XVIlLowx5H8IAA:9
 a=CjuIK1q_8ugA:10
Date:   Thu, 20 Jun 2019 02:08:43 +0200
From:   Jiri Dvorak <jiridvorak@centrum.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Anssi Hannula <anssi.hannula@bitwise.fi>,
        linux-input@vger.kernel.org
Subject: Re: PROBLEM: Race between upload and playback in ff-memless
Message-ID: <20190620020843.547f00ad@centrum.cz>
In-Reply-To: <20190619005234.GE62571@dtor-ws>
References: <20190617224831.7aa9ac53@centrum.cz>
        <20190619005234.GE62571@dtor-ws>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLbwFG7fsq5pp+RMLQ9+maq04/dNksBGwslTpp42RYn/FMebaF//FT2wo4uD8GAWHMIcnobRK3kDN+ZtfZZRkfqogw51KkNsZEOHdttpGf3ODIS2Go6g
 XxJ8iAv436HT+M4GAwudWP/dP4RE9FsVT6k+kbj0mahGAUyB+dAyNlSOAieaQ0SMqfON1MoIM/TUu7OoMpN+5ZW6gfMgjbCkKhf/dFZl97RDaGf2kbQPA7g8
 VDKSe32qwKf0IQw7tGMYww==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

> I wonder if we can't simply leave the FF_EFFECT_PLAYING flag as is
> when updating an effect. Although we still may skip over them in
> ml_get_combo_effect() is play_at is in the future. Should we
> immediately stop updated effects?

Thinking more about it, you need to combine both approaches. If the updated effect should be playing according to the new play_at time (i.e. effect with zero delay), the FF_EFFECT_PLAYING should be left unchanged and the timer will update the force on the next tick as the check will pass (see below for possible issue). If that time is in the future, you need to both clear the flag and stop the force which should fix both the stop behavior and the update behavior inconsistency between single and multiple forces (provided it is desired from backward compatibility perspective).

One additional thing I noticed. mm_ff_upload() with zero delay will set play_at to jiffies and call ml_schedule_timer(). ml_schedule_timer()
will then read a fresh value of jiffies and ignore effects whose play_at is before that value. If the jiffies would be increased between those two reads, no timer would be set for that effect so update would not happen. Is there something which I am missing which would prevent that?

With regards
Jiri
