Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2D85BA58
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfGALH5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 07:07:57 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:44880 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727645AbfGALH4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Jul 2019 07:07:56 -0400
X-Greylist: delayed 456 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Jul 2019 07:07:56 EDT
Received: from mxback8o.mail.yandex.net (mxback8o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::22])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 1F224F216B4;
        Mon,  1 Jul 2019 14:00:19 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback8o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id tmWiHivRlv-0IXOHGaj;
        Mon, 01 Jul 2019 14:00:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hak.pw; s=mail; t=1561978819;
        bh=FbfVOXHvafymJ0I6lv5A3M/584BgbTkRgtmMcLFbp2M=;
        h=In-Reply-To:Cc:To:Subject:From:References:Date:Message-Id;
        b=t+A96BwgU8UgZc1oVLckiopYBWWvEqi7HIxuEI6SguwVK+TPDXiSqyjELg//q/ylD
         CBcV1Rm74NxGI5cNRAfnYz7kC80s6H7iVjM+bbnjLNMQOXpK39o+jbu4AKLHQrrgKo
         G2CoQfp4wP3+bqbkoWXn0wteo2AQaXVIXTunpjWc=
Authentication-Results: mxback8o.mail.yandex.net; dkim=pass header.i=@hak.pw
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vvIkcF89tO-0GvuB3tw;
        Mon, 01 Jul 2019 14:00:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Date:   Mon, 01 Jul 2019 12:00:13 +0100
From:   Abou Abbad <aa@hak.pw>
Subject: Re: HP Elite X2 1012 G1 ALPS touchpad stopped working after BIOS
 upgrade to v1.39
To:     masaki.ota@jp.alps.com
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Message-Id: <1561978813.9768.0@hak.pw>
In-Reply-To: <1561977847.8449.0@hak.pw>
References: <1561977847.8449.0@hak.pw>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

=E3=81=93=E3=82=93=E3=81=AB=E3=81=A1=E3=81=AF=E3=81=BE=E3=81=95=E3=81=8D=E3=
=81=95=E3=82=93
(Hi Mr Masaki) just in case above is wrong!

As the title says, with help from Benjamin Tissoires, the issue seems=20
to be that the touchpad reoports its ID being 0x120D which hid-alps.c=20
does not handle.

For more info, please see this thread, full of info:=20
https://gitlab.freedesktop.org/libinput/libinput/issues/318

Kind regards

PS: Original message was rejected as it contained HTML, this is the=20
plain text version.

=

