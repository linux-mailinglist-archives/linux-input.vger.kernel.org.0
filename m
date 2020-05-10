Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61FF1CCB2F
	for <lists+linux-input@lfdr.de>; Sun, 10 May 2020 14:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEJMpX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 08:45:23 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57529 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbgEJMpX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 08:45:23 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BA846C0004;
        Sun, 10 May 2020 12:45:21 +0000 (UTC)
Message-ID: <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
Subject: Re: [PATCH 1/3] HID: gamecube-adapter: add nintendo gamecube adapter
From:   Bastien Nocera <hadess@hadess.net>
To:     =?ISO-8859-1?Q?Fran=E7ois-Xavier?= Carton <fx.carton91@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Ethan Lee <flibitijibibo@gmail.com>
Date:   Sun, 10 May 2020 14:45:20 +0200
In-Reply-To: <20200506004801.9478-1-fx.carton91@gmail.com>
References: <20200506004801.9478-1-fx.carton91@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-05-06 at 02:47 +0200, François-Xavier Carton wrote:
> The hid-gamecube-adapter driver supports Nintendo Gamecube Controller
> Adapters.  They are USB devices on which up to four Nintendo Gamecube
> Controllers can be plugged. The driver create independent input
> devices
> as controllers are connected.

I think Ethan might be interested in testing this, as he's been using a
user-space version of that in the past:
https://patchwork.kernel.org/patch/11530107/

