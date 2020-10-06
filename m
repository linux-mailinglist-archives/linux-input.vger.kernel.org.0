Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C14284947
	for <lists+linux-input@lfdr.de>; Tue,  6 Oct 2020 11:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgJFJXF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 05:23:05 -0400
Received: from out0.migadu.com ([94.23.1.103]:51102 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFJXF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Oct 2020 05:23:05 -0400
X-Greylist: delayed 449 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Oct 2020 05:23:04 EDT
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
        t=1601975732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pww05EjAV6MyxTDZwHMDdd8qQrr1mUuW9T8/XU436Mg=;
        b=Ki7MQ/bg2Q670JriEUpTA1C18i1KHoxsjwWIuIem9hT2AlrAvmsIIYMQtGfdFdHVEt2/Xv
        ug43g439gCfv18OZFq6niy0Wb7BNNKgN40JH+qqIOLZe45OxGqLE7wq3PuvHdZkM2oIEyw
        7zf2wHdqnlUJrnItsDo+OOqZ5saP2Qk=
Date:   Tue, 06 Oct 2020 09:15:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   kl@kl.wtf
Message-ID: <0ec848359962ebce267168618b816bb4@kl.wtf>
Subject: Re: [PATCH] Input: evdev - per-client waitgroups
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201005233500.GM1009802@dtor-ws>
References: <20201005233500.GM1009802@dtor-ws>
 <20200429184126.2155-1-kl@kl.wtf>
X-Spam-Score: -2.87
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

October 6, 2020 1:35 AM, dmitry.torokhov@gmail.com wrote:=0A=0A> On Wed, =
Apr 29, 2020 at 08:41:26PM +0200, Kenny Levinsen wrote:=0A> =0A>> All evd=
ev clients share a common waitgroup. On new input events, this=0A>> waitg=
roup is woken once for every client that did not filter the events,=0A> =
=0A> I am having trouble parsing the changelog (I think I agree with the=
=0A> change itself). Did you mean to say "this waitqueue wakes up every=
=0A> client, even ones that requested to filter out events that are being=
=0A> delivered, leading to duplicated and unwanted wakeups"?=0A=0AAh, I s=
uppose my original wording was a bit convoluted. Perhaps the following=0A=
is clearer:=0A=0A	All evdev clients share a common waitgroup. On new inpu=
t events, all=0A	clients waiting on this waitgroup are woken up, even tho=
se filtering=0A	out the events, possibly more than once per event. This l=
eads to=0A	duplicated and unwanted wakeups.=0A=0AWhat I tried to say is t=
hat not only do all clients polling the device/blocked=0Aon read end up w=
oken up, instead of being woken just once, they are woken once=0Afor ever=
y client that was interested in the event.=0A=0ASo, if you have two clien=
ts interested and one uninterested, then the shared=0Awaitgroup that all =
three clients are waiting on is woken up twice in a row.=0A=0AShould I se=
nd an updated patch with the new wording? I'm also fine with your=0Asugge=
sted wording if you prefer that.=0A=0ABest regards,=0AKenny Levinsen
