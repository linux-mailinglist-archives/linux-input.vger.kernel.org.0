Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C376B491A8
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 22:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbfFQUse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 16:48:34 -0400
Received: from vie01a-dmta-pe05-1.mx.upcmail.net ([84.116.36.11]:53006 "EHLO
        vie01a-dmta-pe05-1.mx.upcmail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725497AbfFQUse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 16:48:34 -0400
Received: from [172.31.216.234] (helo=vie01a-pemc-psmtp-pe11.mail.upcmail.net)
        by vie01a-dmta-pe05.mx.upcmail.net with esmtp (Exim 4.92)
        (envelope-from <jiridvorak@centrum.cz>)
        id 1hcyYK-0000ho-GS
        for linux-input@vger.kernel.org; Mon, 17 Jun 2019 22:48:32 +0200
Received: from localhost ([94.113.181.121])
        by vie01a-pemc-psmtp-pe11.mail.upcmail.net with ESMTP
        id cyYKh0hdoEZz0cyYKhCzYN; Mon, 17 Jun 2019 22:48:32 +0200
X-Env-Mailfrom: jiridvorak@centrum.cz
X-Env-Rcptto: linux-input@vger.kernel.org
X-SourceIP: 94.113.181.121
X-CNFS-Analysis: v=2.3 cv=E8KzWpVl c=1 sm=1 tr=0
 a=s7YJerHMVUoi9pLLx4laNg==:117 a=s7YJerHMVUoi9pLLx4laNg==:17
 a=kj9zAlcOel0A:10 a=fGO4tVQLAAAA:8 a=nZYFt6r2ZZ5_v5vC3FQA:9 a=CjuIK1q_8ugA:10
Date:   Mon, 17 Jun 2019 22:48:31 +0200
From:   Jiri Dvorak <jiridvorak@centrum.cz>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org
Subject: PROBLEM: Race between upload and playback in ff-memless
Message-ID: <20190617224831.7aa9ac53@centrum.cz>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBPDv/49HB//NB0nVFLMThy8YnINChfMSHyLRPOW9lvNem6fnaru7wuWaxmpwvqaaETwX3oqXKdMvlpbpmWWB/0f8aAvG+3RqAec7PeApgFY01lF8kmK
 aDZRyojvGOnBdxfhL5yKZUCESS3Jf9IIOOEaQMrC+jS/sPIk8JIx3kEwIjACfgcU0WX4lRj4po+le90wsbqXh2T/Ot0DT5dzWLYuJA99OcFUvNvHnU++++RA
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello

[1.] One line summary of the problem:

Race between upload and playback in ff-memless

[2.] Full description of the problem/report:

If update of already playing force effect is quickly followed by effect stop in ff-memless based driver, the hw force might be not stopped.

What I think is going on: When ml_ff_upload processes started effect, it will clear the FF_EFFECT_PLAYING bit and schedule timer. If ml_ff_playback is called to stop the effect before the timer runs, it will see cleared bit and directly clear the FF_EFFECT_STARTED bit instead of doing the full abort so the hw force is not updated unless there is another effect of the same type.

[3.] Keywords (i.e., modules, networking, kernel):

input, force feedback, ff-memless

[4.] Kernel information
[5.] Most recent kernel version which did not have the bug:

Looking at the source code it seems to be present in all versions of ff-memless since its introduction.

[7.] A small shell script or example program which triggers the
     problem (if possible)

https://pastebin.com/yaQTXgk6

With regards
Jiri Dvorak
