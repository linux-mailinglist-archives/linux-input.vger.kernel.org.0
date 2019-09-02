Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A627A52B6
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2019 11:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbfIBJXp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Sep 2019 05:23:45 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45099 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbfIBJXp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Sep 2019 05:23:45 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 04D171BF221;
        Mon,  2 Sep 2019 09:23:41 +0000 (UTC)
Message-ID: <99cffa73439fd0d59fa738d786545f5a6e35ab4d.camel@hadess.net>
Subject: Re: [PATCH v5] hid-logitech-hidpp: read battery voltage from newer
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Pedro Vanzella <pedro@pedrovanzella.com>,
        linux-input@vger.kernel.org
Cc:     lains@archlinux.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Date:   Mon, 02 Sep 2019 11:23:41 +0200
In-Reply-To: <20190831175659.7404-1-pedro@pedrovanzella.com>
References: <20190831175659.7404-1-pedro@pedrovanzella.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2019-08-31 at 13:56 -0400, Pedro Vanzella wrote:
> Newer Logitech mice report their battery voltage through feature
> 0x1001
> instead of the battery levels through feature 0x1000.
> 
> When the device is brought up and we try to query the battery, figure
> out if it supports the old or the new feature. If it supports the new
> feature, record the feature index and read the battery voltage and
> its status.

FWIW, it wasn't clear to me that there were 3 bytes, and the last one
would contain the battery status. I was under the impression reading
this that the only thing the mouse would send back would be the
voltage, so this might need a slight rewording.

Did you test this with upower? Did it work as you expected?

Cheers

