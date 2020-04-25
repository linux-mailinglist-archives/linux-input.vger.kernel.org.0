Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD391B86AE
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 15:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgDYNCA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 09:02:00 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50321 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgDYNB7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 09:01:59 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CCC03C0008;
        Sat, 25 Apr 2020 13:01:56 +0000 (UTC)
Message-ID: <6ed519c074b40de74b4643867b5cae48beaf04af.camel@hadess.net>
Subject: Re: [PATCH v11 05/11] HID: nintendo: add rumble support
From:   Bastien Nocera <hadess@hadess.net>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com
Date:   Sat, 25 Apr 2020 15:01:55 +0200
In-Reply-To: <20200317032928.546172-6-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
         <20200317032928.546172-6-djogorchock@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-03-16 at 22:29 -0500, Daniel J. Ogorchock wrote:
> This patch adds support for controller rumble.
> <snip>
> +config NINTENDO_FF

This should probably be CONFIG_HID_NINTENDO_FF, right?

