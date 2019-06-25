Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5887154E10
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2019 13:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfFYL6E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jun 2019 07:58:04 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44647 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfFYL6E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jun 2019 07:58:04 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0184D240003;
        Tue, 25 Jun 2019 11:57:57 +0000 (UTC)
Message-ID: <0f71295ad704971729c14fb6655ee7714bd0f025.camel@hadess.net>
Subject: Re: [PATCH] HID: sb0540: add support for Creative SB0540 IR
 receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 25 Jun 2019 13:57:52 +0200
In-Reply-To: <c1970f77c797e40717c610ae447e2876eb62e2cb.camel@hadess.net>
References: <58ee0e02bd6bee1e73f60077b940e0c5d3738253.camel@hadess.net>
         <c1970f77c797e40717c610ae447e2876eb62e2cb.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-06-24 at 17:11 +0200, Bastien Nocera wrote:
> On Mon, 2019-06-24 at 13:33 +0200, Bastien Nocera wrote:
> > With initial reviews from Benjamin Tissoires.
> 
> If anyone has ideas about what to use for the keys I set to
> KEY_RESERVED, given the markings on the remotes themselves:
> https://github.com/hadess/creative-sb0540

I left the wheels unbound, and updated the other keys so they're all
bound more or less according to:
https://linuxtv.org/downloads/v4l-dvb-apis/uapi/rc/rc-tables.html

Cheers

