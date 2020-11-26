Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4193D2C5DA2
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 22:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgKZVuK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 16:50:10 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33273 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388678AbgKZVuK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 16:50:10 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9CF7E20003;
        Thu, 26 Nov 2020 21:50:07 +0000 (UTC)
Message-ID: <a9425b1382c76c2d6d234a1a7af7c2f738eca0e4.camel@hadess.net>
Subject: Re: Support for Logitech g703 mouse battery levels
From:   Bastien Nocera <hadess@hadess.net>
To:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Max Illis <max@illis.uk>, linux-input@vger.kernel.org
Date:   Thu, 26 Nov 2020 22:50:07 +0100
In-Reply-To: <c80acf5d8bfea8eef32be6b31d444787ed8182de.camel@archlinux.org>
References: <CAA5fPw=5SJvsYjoZDECAhHDe5XeLt-HmEvMrmgaeJ7hQMwHnRg@mail.gmail.com>
         <f0a3e23f8e650b679fde299702685588b6cf54a3.camel@hadess.net>
         <ef254031acfe25c2fccb1fb724fc7889117e451e.camel@archlinux.org>
         <992fe59c8da939e1adae51c8e6a52812da05e700.camel@hadess.net>
         <c80acf5d8bfea8eef32be6b31d444787ed8182de.camel@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-11-26 at 19:10 +0000, Filipe Laíns wrote:
> <snip>
> I did not have it at the time, Logitech has since made it public.
> 
> I went looking for the link :)
> https://drive.google.com/file/d/1F_fuqL0-TbZ77u0suXRcj3YcDidCcN1M/view?usp=sharing

Looks small enough to put in the kernel to be fair. The hid++ source is
already 4k long, what's 100 more lines ;)

