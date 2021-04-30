Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C2736F35B
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 02:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhD3A7w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 20:59:52 -0400
Received: from vps.thesusis.net ([34.202.238.73]:37604 "EHLO vps.thesusis.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhD3A7w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 20:59:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by vps.thesusis.net (Postfix) with ESMTP id 849F72ECDB;
        Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
        by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PUoBqIdkD_Xa; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
        id 3F4522ECDA; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com> <87o8dw8vyg.fsf@vps.thesusis.net> <YItQ72UkqyKuHEk4@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From:   Phillip Susi <phill@thesusis.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date:   Thu, 29 Apr 2021 20:57:38 -0400
In-reply-to: <YItQ72UkqyKuHEk4@google.com>
Message-ID: <87im448u5j.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Dmitry Torokhov writes:

> Userspace may or may not have access to sysfs (it does not have to be
> mounted)

How would userspace even enumerate the input devices and read their
modalias without sysfs?
